const express = require('express');
const morgan = require('morgan');
const rateLimit = require('express-rate-limit');
const helmet = require('helmet');
const mongoSanitize = require('express-mongo-sanitize');
const xss = require('xss-clean');
const hpp = require('hpp');
const cookieParser = require('cookie-parser');
const compression = require('compression');
const cors = require('cors');
const mongoose = require('mongoose');
require('dotenv').config(); // <-- load env FIRST
const swaggerUI = require('swagger-ui-express');
const swaggerSpec = require('./swagger/swagger');
const AppError = require('./utils/appError');
const errorGlobal = require('./controllers/errorController');

// Start express app
const app = express();

// 1) GLOBAL MIDDLEWARES
app.use(cors());
app.options('*', cors());
app.use(helmet());

if (process.env.NODE_ENV === 'development') {
  app.use(morgan('dev'));
}

const limiter = rateLimit({
  max: 100,
  windowMs: 60 * 60 * 1000,
  message: 'Too many requests from this IP, please try again in an hour!',
});
app.use('/api', limiter);

app.use(express.json({ limit: '10kb' }));
app.use(express.urlencoded({ extended: true, limit: '10kb' }));
app.use(cookieParser());
app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(mongoSanitize());
app.use(xss());
app.use(
  hpp({
    whitelist: ['duration', 'difficulty', 'price'],
  }),
);
app.use(compression());

// R <dont remove this line>
const settingRouter = require('./routes/settingRoutes');
const shipmentRouter = require('./routes/shipmentRoutes');
const storageOperationsRouter = require('./routes/storageOperationsRoutes');
const serviceTypeRouter = require('./routes/serviceTypeRoutes');
const parcelRouter = require('./routes/parcelRoutes');
const typeParcelRouter = require('./routes/typeParcelRoutes');
const ratingsRouter = require('./routes/ratingsRoutes');
const serviceCentersRouter = require('./routes/serviceCentersRoutes');
const userRouter = require('./routes/userRoutes');

app.use('/docs', swaggerUI.serve, swaggerUI.setup(swaggerSpec));
// ROUTES <dont remove this line>
app.use('/api/v1.0.0/settings', settingRouter);
app.use('/api/v1.0.0/shipments', shipmentRouter);
app.use('/api/v1.0.0/storageOperations', storageOperationsRouter);
app.use('/api/v1.0.0/serviceTypes', serviceTypeRouter);
app.use('/api/v1.0.0/parcels', parcelRouter);
app.use('/api/v1.0.0/typeParcels', typeParcelRouter);
app.use('/api/v1.0.0/ratings', ratingsRouter);
app.use('/api/v1.0.0/serviceCenters', serviceCentersRouter);
app.use('/api/v1.0.0/users', userRouter);

// Handle not found
app.all('*', (req, res, next) => {
  next(new AppError(`Can't find ${req.originalUrl} on this server!`, 404));
});
app.use(errorGlobal);

// 4) DB connection
console.log('DATABASE_LOCAL:', process.env.DATABASE_LOCAL); // <-- debug check

mongoose
  .connect(process.env.DATABASE_LOCAL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    app.listen(process.env.PORT, () => {
      console.log(
        `✅ Example app listening at http://localhost:${process.env.PORT}
✅ Swagger docs at http://localhost:${process.env.PORT}/docs`,
      );
    });
  })
  .catch((err) => {
    console.error('❌ Database connection error:', err);
  });
