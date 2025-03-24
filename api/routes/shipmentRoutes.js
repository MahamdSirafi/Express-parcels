const shipmentController = require('../controllers/shipmentController');
const { protect, restrictTo } = require('./../middlewares/authMiddlewers');
const { RoleCode } = require('./../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const express = require('express');
const router = express.Router();
router.use(protect);
router
  .route('/')
  .get(restrictTo(ADMIN, EMP), shipmentController.getAllShipment)
  .post(restrictTo(ADMIN, EMP), shipmentController.createShipment);
router
  .route('/:id')
  .get(restrictTo(ADMIN, EMP), shipmentController.getShipment)
  .patch(restrictTo(ADMIN, EMP), shipmentController.updateShipment)
  .delete(restrictTo(ADMIN, EMP), shipmentController.deleteShipment);
  const { addParcelToShipment } = require('../controllers/shipmentController');
router.post('/addParcel', addParcelToShipment);
const { deliverShipment } = require('../controllers/shipmentController');
router.post('/deliver', deliverShipment);

module.exports = router;
