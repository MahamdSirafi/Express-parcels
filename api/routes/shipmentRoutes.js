const { deliverShipment } = require('../controllers/shipmentController');
const { addParcelToShipment } = require('../controllers/shipmentController');
const shipmentController = require('../controllers/shipmentController');
const { protect, restrictTo } = require('./../middlewares/authMiddlewers');
const { addVarBody} = require('./../middlewares/dynamicMiddleware');
const { RoleCode } = require('./../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const express = require('express');
const router = express.Router();
router.use(protect);
router.post('/addParcel', addParcelToShipment);
router.post('/deliver', deliverShipment);
router
  .route('/:id/indelevery')
  .patch(restrictTo(EMP),addVarBody("status","indelivery"), shipmentController.updateShipment)
  router
  .route('/outpcaking')
  .get(restrictTo(EMP), shipmentController.getAllShipmentOutpcaking);
 
router
  .route('/forpacking')
  .get(restrictTo(EMP), shipmentController.getAllShipmentFree);
router
  .route('/')
  .get(restrictTo(ADMIN, EMP), shipmentController.getAllShipment)
  .post(restrictTo( EMP), shipmentController.createShipment);
router
  .route('/:id')
  .get(restrictTo(ADMIN, EMP), shipmentController.getShipment)
  .patch(restrictTo(EMP), shipmentController.updateShipment)
  .delete(restrictTo(ADMIN, EMP), shipmentController.deleteShipment); 
module.exports = router;
