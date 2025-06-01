const parcelController = require('../controllers/parcelController');
const { protect, restrictTo } = require('./../middlewares/authMiddlewers');
const { RoleCode } = require('./../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const { addQuery, addVarBody } = require('./../middlewares/dynamicMiddleware');
const express = require('express');
const router = express.Router();
router.use(protect);
router.route('/:id/paid').patch(restrictTo(EMP), parcelController.paid);
router.route('/:id/canceld').patch(restrictTo(USER), parcelController.canceled);
router
  .route('/:id/done')
  .patch(
    restrictTo(EMP),
    addVarBody('status', 'delivered'),
    parcelController.updateParcel,
  );
router.route('/:id/location').get(restrictTo(USER), parcelController.location);
router
  .route('/mine')
  .get(
    restrictTo(USER),
    addQuery('userId', 'userId'),
    parcelController.getAllParcel,
  );

router
  .route('/')
  .get(restrictTo(ADMIN, EMP), parcelController.getAllParcel)
  .post(restrictTo(EMP), parcelController.createParcel);
router
  .route('/:id')
  .get(restrictTo(USER, ADMIN, EMP), parcelController.getParcel)
  .patch(restrictTo(ADMIN, EMP), parcelController.updateParcel)
  .delete(restrictTo(ADMIN, EMP), parcelController.deleteParcel);
module.exports = router;
