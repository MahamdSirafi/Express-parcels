const Parcel = require('../models/parcelModel');
const storageOperationsModel = require('../models/storageOperationsModel');
const AppError = require('../utils/appError');
const handlerFactory = require('../utils/handlerFactory');
const catchAsync = require('../utils/catchAsync');
const { payment_method } = require('../utils/enum');
exports.getParcel = handlerFactory.getOne(Parcel);
exports.createParcel = catchAsync(async (req, res, next) => {
  body.source_centerId = req.user.centerId;
  req.price = 8 + Math.random() * 200; //طلب خدمة خارجية لحساب السعر والمدة
  const doc = await Parcel.create(req.body);
  await storageOperationsModel.create({
    parcelId: doc._id,
    centerId: req.user.centerId,
  });
  res.status(201).json({
    status: 'success',
    doc,
  });
});

exports.updateParcel = handlerFactory.updateOne(Parcel);
exports.deleteParcel = handlerFactory.deleteOne(Parcel);
exports.getAllParcel = handlerFactory.getAll(Parcel);
exports.paid = catchAsync(async (req, res, next) => {
  req.body = {
    payment_method: req.body.payment_method,
    status: 'Inprocess',
  };
  const doc = await Parcel.findByIdAndUpdate(req.params.id, req.body, {
    new: true,
    runValidators: true,
  });
  if (!doc) {
    return next(new AppError('No document found with that ID', 404));
  }
  res.status(200).json({
    status: 'success',
    doc,
  });
});
exports.canceled = catchAsync(async (req, res, next) => {
  req.body = {
    status: 'Canceled',
  };
  const thisdoc = await Parcel.findById(req.params.id);
  if (thisdoc.status !== 'Inprocess')
    return next(AppError('cannot cancal', 403));

  const doc = await Parcel.findByIdAndUpdate(req.params.id, req.body, {
    new: true,
    runValidators: true,
  });
  if (!doc) {
    return next(new AppError('No document found with that ID', 404));
  }
  res.status(200).json({
    status: 'success',
    doc,
  });
});
