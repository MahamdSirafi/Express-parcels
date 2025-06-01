const settingController = require('../controllers/settingController');
const { protect, restrictTo } = require('./../middlewares/authMiddlewers');
const { RoleCode } = require('./../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const express = require('express');
const router = express.Router();
router.use(protect);
router
  .route('/generate_Prices')
  .post(restrictTo(ADMIN), settingController.generatePrices)
router
  .route('/')
  .get(restrictTo(ADMIN), settingController.getAllSetting)
  .post(restrictTo(ADMIN), settingController.createSetting);
router
  .route('/:id')
  .get(restrictTo(ADMIN), settingController.getSetting)
  .patch(restrictTo(ADMIN), settingController.updateSetting)
  .delete(restrictTo(ADMIN), settingController.deleteSetting);
module.exports = router;
