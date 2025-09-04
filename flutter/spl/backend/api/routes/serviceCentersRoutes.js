const serviceCentersController = require('../controllers/serviceCentersController');
const { protect, restrictTo } = require('./../middlewares/authMiddlewers');
const { RoleCode } = require('./../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const express = require('express');
const router = express.Router();
router.use(protect);
router
  .route('/')
  .get(
    restrictTo(USER, ADMIN, EMP),
    serviceCentersController.getAllServiceCenters,
  )
  .post(restrictTo(ADMIN), serviceCentersController.createServiceCenters);
router
  .route('/:id')
  .get(restrictTo(USER, ADMIN, EMP), serviceCentersController.getServiceCenters)
  .patch(restrictTo(ADMIN), serviceCentersController.updateServiceCenters)
  .delete(restrictTo(ADMIN), serviceCentersController.deleteServiceCenters);
module.exports = router;
