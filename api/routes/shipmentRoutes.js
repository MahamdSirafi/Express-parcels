const shipmentController = require('../controllers/shipmentController');
const { protect, restrictTo } = require('./../middlewares/authMiddlewers');
const { addVarBody } = require('./../middlewares/dynamicMiddleware');
const { RoleCode } = require('./../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const express = require('express');
const router = express.Router();
router.use(protect);
router
  .route('/addParcel')
  .post(restrictTo(EMP), shipmentController.addParcelToShipment);
router
  .route('/deliver')
  .post(restrictTo(EMP), shipmentController.deliverShipment);
router
  .route('/:id/indelivery')
  .patch(
    restrictTo(EMP),
    addVarBody('status', 'indelivery'),
    shipmentController.updateShipment,
  );
router
  .route('/out-for-packing')
  .get(restrictTo(EMP), shipmentController.getAllShipmentOutforpcaking);

router
  .route('/ready-for-packing')
  .get(restrictTo(EMP), shipmentController.getAllShipmentFree);
router
  .route('/')
  .get(restrictTo(ADMIN, EMP), shipmentController.getAllShipment)
  .post(restrictTo(EMP), shipmentController.createShipment);
router
  .route('/:id')
  .get(restrictTo(ADMIN, EMP), shipmentController.getShipment)
  .patch(restrictTo(EMP), shipmentController.updateShipment)
  .delete(restrictTo(ADMIN, EMP), shipmentController.deleteShipment);
module.exports = router;
