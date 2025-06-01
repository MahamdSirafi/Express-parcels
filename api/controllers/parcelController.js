const Parcel = require('../models/parcelModel');
const Setting = require('../models/settingModel');
const storageOperationsModel = require('../models/storageOperationsModel');
const AppError = require('../utils/appError');
const handlerFactory = require('../utils/handlerFactory');
const catchAsync = require('../utils/catchAsync');
const { payment_method } = require('../utils/enum');
exports.getParcel = handlerFactory.getOne(Parcel);

exports.createParcel = catchAsync(async (req, res, next) => {
  req.body.source_centerId = req.user.centerId;
  const setting = await Setting.findOne({
    serviceTypeId: req.body.serviceTypeId,
    target_centerId: req.body.target_centerId,
    typeparcelId: req.body.typeparcelId,
    source_centerId: req.user.centerId,
  });
  // req.body.price = 8 + Math.random() * 200; //طلب خدمة خارجية لحساب السعر والمدة

  req.body.price = setting.price;
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
    status: 'paid',
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
  if (thisdoc.status !== 'Inprocess' || thisdoc.status !== 'paid')
    return next(new AppError('cannot cancal', 403));
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
exports.location = catchAsync(async (req, res, next) => {
  // توليد خط عرض عشوائي بين 32 و37
  const latitude = (Math.random() * 5 + 32).toFixed(6);

  // توليد خط طول عشوائي بين 35 و42
  const longitude = (Math.random() * 7 + 35).toFixed(6);

  res.status(200).json({
    status: 'success',
    doc: {
      longitude,
      latitude,
    },
  });
});
