const typeParcelController = require('../controllers/typeParcelController');
const { protect, restrictTo } = require('./../middlewares/authMiddlewers');
const { RoleCode } = require('./../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const express = require('express');
const router = express.Router();
router.use(protect);
router
  .route('/')
  .get(restrictTo(USER, ADMIN, EMP), typeParcelController.getAllTypeParcel)
  .post(restrictTo(ADMIN), typeParcelController.createTypeParcel);
router
  .route('/:id')
  .get(restrictTo(USER, ADMIN, EMP), typeParcelController.getTypeParcel)
  .patch(restrictTo(ADMIN), typeParcelController.updateTypeParcel)
  .delete(restrictTo(ADMIN), typeParcelController.deleteTypeParcel);
module.exports = router;
