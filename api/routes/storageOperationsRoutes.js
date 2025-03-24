const storageOperationsController = require('../controllers/storageOperationsController');
const { protect, restrictTo } = require('../middlewares/authMiddlewers');
const { RoleCode } = require('../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const express = require('express');
const router = express.Router();
router.use(protect);
router
  .route('/maine')
  .get(restrictTo(EMP), storageOperationsController.getAllstorageOperations);
router
  .route('/')
  .get(restrictTo(ADMIN), storageOperationsController.getAllstorageOperations)
  .post(restrictTo(ADMIN, EMP),storageOperationsController.createstorageOperations);
router
  .route('/:id')
  .get(restrictTo(ADMIN, EMP), storageOperationsController.getstorageOperations)
  .patch(restrictTo(ADMIN, EMP), storageOperationsController.updatestorageOperations)
  .delete(restrictTo(ADMIN, EMP), storageOperationsController.deletestorageOperations);
module.exports = router;
