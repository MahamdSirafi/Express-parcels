const express = require('express');
const userController = require('./../controllers/userController');
const authController = require('./../controllers/authController');
const authMiddlewers = require('./../middlewares/authMiddlewers');
const imguserMiddlewers = require('./../middlewares/imguserMiddlewers');
const router = express.Router();
router.post('/login', authController.login);     // تم 
router.get('/logout', authController.logout);     // تم 
router.post('/forgotPassword', authController.forgotPassword);     // تم 
router.patch('/resetPassword/:token', authController.resetPassword);    // تم 
router.get('/resetPassword/:token', (req, res) => {
  res.render('user/resetPassword4');     // ما رح تشتغل الا اذا رح اشتغل واجهة متكاملة لام برجع اتش تي ام ال
});
router.post('/signup', authController.signup);      // تم 
router.patch('/activeMe', authMiddlewers.protect, userController.activeMe); // مالنادخل
router.patch(
  '/updateMyPassword',
  authMiddlewers.protect,
  authController.updatePassword,   // تم 
);
router.get(
  '/me',
  authMiddlewers.protect,
  userController.getMe,
  userController.getUser,  // تم بروفايل
);
router.patch(
  '/updateMeAndUpload',
  authMiddlewers.protect,
  imguserMiddlewers.uploadUserPhoto,
  userController.updateMe,
);
router.patch('/updateMe', authMiddlewers.protect, userController.updateMe);  // تم 
router
  .route('/')
  .get(
    authMiddlewers.protect,
    authMiddlewers.isactive,
    authMiddlewers.restrictTo('ADMIN', 'EMP'),
    userController.getAllUsers, // تم 
  )
  .post(
    authMiddlewers.protect,
    authMiddlewers.isactive,
    authMiddlewers.restrictTo('ADMIN'),
    userController.createUser, // تم 
  );
router
  .route('/:id')
  .get(
    authMiddlewers.protect,
    authMiddlewers.isactive,
    authMiddlewers.restrictTo('ADMIN'),
    userController.getUser, // تم 
  )
  .patch(
    authMiddlewers.protect,
    authMiddlewers.isactive,
    authMiddlewers.restrictTo('ADMIN'),
    userController.updateUser, // تم 
  )
  .delete(
    authMiddlewers.protect,
    authMiddlewers.isactive,
    authMiddlewers.restrictTo('ADMIN'),
    userController.deleteUser, // تم 
  );
module.exports = router;
