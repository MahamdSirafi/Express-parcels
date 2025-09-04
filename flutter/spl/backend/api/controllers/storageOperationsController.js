const storageOperations = require('../models/storageOperationsModel');
const AppError = require('../utils/appError');
const handlerFactory = require('../utils/handlerFactory');
const catchAsync = require('../utils/catchAsync');
exports.getstorageOperations = handlerFactory.getOne(storageOperations);
exports.createstorageOperations = handlerFactory.createOne(storageOperations);
exports.getAllProessStorForCenter = catchAsync(async (req, res, next) => {
  req.query.centerId = req.user.centerId;
  let features =
    !req.query.agg && !req.query.aggDate
      ? new APIFeatures(Model.find(), req.query)
          .filter()
          .sort()
          .limitFields()
          .paginate()
      : new APIFeatures(Model, req.query).agg().aggDate();
  const doc = await features.query;
  res.status(200).json({
    status: 'success',
    results: doc.length,
    doc,
  });
});
exports.updatestorageOperations = handlerFactory.updateOne(storageOperations);
exports.deletestorageOperations = handlerFactory.deleteOne(storageOperations);
exports.getAllstorageOperations = catchAsync(async (req, res, next) => {
  const doc = await storageOperations.find({
    centerId: req.user.centerId,
    timeOut: null,
  });
  res.status(200).json({
    status: 'success',
    results: doc.length,
    doc,
  });
});
