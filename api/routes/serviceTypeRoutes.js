const serviceTypeController = require('../controllers/serviceTypeController');
const { protect, restrictTo } = require('./../middlewares/authMiddlewers');
const { RoleCode } = require('./../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const express = require('express');
const router = express.Router();
router.use(protect);
router
  .route('/')
  .get(restrictTo(USER, ADMIN, EMP), serviceTypeController.getAllServiceType)
  .post(restrictTo(ADMIN, EMP), serviceTypeController.createServiceType);
router
  .route('/:id')
  .get(restrictTo(USER, ADMIN, EMP), serviceTypeController.getServiceType)
  .patch(restrictTo(ADMIN, EMP), serviceTypeController.updateServiceType)
  .delete(restrictTo(ADMIN, EMP), serviceTypeController.deleteServiceType);
module.exports = router;
