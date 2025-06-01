const swaggerJsDoc = require('swagger-jsdoc');
const {
  Setting,
  createSetting,
  updateSetting,
} = require('./routes/settingSwagger');
const {
  Shipment,
  createShipment,
  updateShipment,
} = require('./routes/shipmentSwagger');
const {
  storageOPerations,
  createstorageOPerations,
  updatestorageOPerations,
} = require('./routes/storageOperationsSwagger');
const {
  ServiceType,
  createServiceType,
  updateServiceType,
} = require('./routes/serviceTypeSwagger');
const {
  Parcel,
  createParcel,
  updateParcel,
} = require('./routes/parcelSwagger');
const {
  TypeParcel,
  createTypeParcel,
  updateTypeParcel,
} = require('./routes/typeParcelSwagger');
const {
  Ratings,
  createRatings,
  updateRatings,
} = require('./routes/ratingsSwagger');
const {
  ServiceCenters,
  createServiceCenters,
  updateServiceCenters,
} = require('./routes/serviceCentersSwagger');
const { signUp } = require('./routes/auth');
const { User, updateMe, createUser } = require('./routes/users');
const {
  DuplicateEmail,
  Error,
  Forbidden,
  NotFound,
  Unauthorized,
} = require('./components');

const options = {
  url: '',
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'REST API Docs',
      version: '1.0.0',
      description:
        'This is a simple API for authentication made with Express and documented with Swagger',
    },
    servers: [
      {
        url: 'http://localhost:7000/api/v1.0.0',
        description: 'Development server',
      },
    ],
    components: {
      schemas: {
        Setting,
        createSetting,
        updateSetting,
        Shipment,
        createShipment,
        updateShipment,
        storageOPerations,
        createstorageOPerations,
        updatestorageOPerations,
        ServiceType,
        createServiceType,
        updateServiceType,
        Parcel,
        createParcel,
        updateParcel,
        TypeParcel,
        createTypeParcel,
        updateTypeParcel,
        Ratings,
        createRatings,
        updateRatings,
        ServiceCenters,
        createServiceCenters,
        updateServiceCenters,
        signUp,
        createUser,
        updateMe,
        User,
        Error,
      },
      securitySchemes: {
        Bearer: {
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT',
          description: 'Enter the token: abcde12345".',
        },
      },
      responses: {
        DuplicateEmail,
        Forbidden,
        NotFound,
        Unauthorized,
        201: {
          description: 'Created',
        },
        200: {
          description: 'OK',
        },
        204: {
          description: 'No Content',
        },
        400: {
          description: 'Bad Request',
        },
        401: {
          description: 'Unauthorized',
        },
        403: {
          description: 'Forbidden',
        },
        404: {
          description: 'Not Found',
        },
        500: {
          description: 'Internal Server Error',
        },
      },
    },
  },
  apis: ['./swagger/routes/*.js'],
};

const swaggerSpec = swaggerJsDoc(options);
module.exports = swaggerSpec;
