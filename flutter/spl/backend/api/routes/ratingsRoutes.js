const ratingsController = require('../controllers/ratingsController');
const { protect, restrictTo } = require('./../middlewares/authMiddlewers');
const { RoleCode } = require('./../utils/enum');
const { USER, ADMIN, EMP } = RoleCode;
const express = require('express');
const router = express.Router();
router.use(protect);
router
  .route('/')
  .get(restrictTo(ADMIN), ratingsController.getAllRatings)
  .post(restrictTo(USER), ratingsController.createRatings);
router
  .route('/:id')
  .get(restrictTo(USER, ADMIN), ratingsController.getRatings)
  .patch(restrictTo(USER), ratingsController.updateRatings)
  .delete(restrictTo(USER), ratingsController.deleteRatings);
module.exports = router;
