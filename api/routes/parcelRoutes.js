const parcelController = require('../controllers/parcelController');
const { protect, restrictTo } = require('./../middlewares/authMiddlewers');
const { RoleCode } = require('./../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const express = require('express');
const router = express.Router();
router.use(protect);
router
  .route('/')
  .get(restrictTo(USER, ADMIN, EMP), parcelController.getAllParcel)
  .post(restrictTo(ADMIN, EMP), parcelController.createParcel);
router
  .route('/:id')
  .get(restrictTo(USER, ADMIN, EMP), parcelController.getParcel)
  .patch(restrictTo(ADMIN, EMP), parcelController.updateParcel)
  .delete(restrictTo(ADMIN, EMP), parcelController.deleteParcel);
module.exports = router;
