const orderController = require('../controllers/orderController');
const { protect, restrictTo } = require('./../middlewares/authMiddlewers');
const { addQuery } = require('./../middlewares/dynamicMiddleware');
const { RoleCode } = require('./../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const express = require('express');
const router = express.Router();
router.use(protect);
router
  .route('/mine')
  .get(
    restrictTo(USER),
    addQuery('userId', 'userId'),
    orderController.getAllOrder,
  );
router
  .route('/')
  .get(restrictTo(ADMIN, EMP), orderController.getAllOrder)
  .post(
    restrictTo(EMP),
    (req, res, next) => {
      req.body.source_lactionId = req.user.centerId;
      next();
    },
    orderController.createOrder,
  );
router
  .route('/:id')
  .get(restrictTo(ADMIN, EMP), orderController.getOrder)
  .patch(restrictTo(EMP), orderController.updateOrder)
  .delete(restrictTo(EMP), orderController.deleteOrder);
module.exports = router;
