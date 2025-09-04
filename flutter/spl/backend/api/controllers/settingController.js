const Price = require('../models/settingModel');
const ServiceCenter = require('../models/serviceCentersModel');
const TypeParcel = require('../models/typeParcelModel');
const ServiceType = require('../models/serviceTypeModel');
const AppError = require('../utils/appError');
const handlerFactory = require('../utils/handlerFactory');
const catchAsync = require('../utils/catchAsync');

exports.getSetting = handlerFactory.getOne(
  Price,
  { path: 'typeParcelId', select: 'name' },
  { path: 'serviceTypeId', select: 'name' },
  { path: 'source_centerId', select: 'name' },
  { path: 'target_centerId', select: 'name' },
);

exports.createSetting = handlerFactory.createOne(Price);
exports.updateSetting = handlerFactory.updateOne(Price);
exports.deleteSetting = handlerFactory.deleteOne(Price);
exports.getAllSetting = handlerFactory.getAllpop1(
  Price,
  { path: 'typeParcelId', select: 'name' },
  { path: 'serviceTypeId', select: 'name' },
  { path: 'source_centerId', select: 'name' },
  { path: 'target_centerId', select: 'name' },
);

exports.generatePrices = catchAsync(async (req, res, next) => {
  const centers = await ServiceCenter.find();
  const services = await ServiceType.find();
  const typeParcels = await TypeParcel.find();

  if (centers.length < 2 || services.length === 0 || typeParcels.length === 0) {
    return next(new AppError('No information available', 400));
  }

  const prices = [];

  for (let source of centers) {
    for (let target of centers) {
      if (source._id.equals(target._id)) continue;

      for (let service of services) {
        for (let typeParcel of typeParcels) {
          // تحقق من وجود السجل مسبقًا
          const exists = await Price.exists({
            source_centerId: source._id,
            target_centerId: target._id,
            serviceTypeId: service._id,
            typeParcelId: typeParcel._id,
          });

          if (exists) continue; // تجاهل إذا كان موجود مسبقًا

          const randomPrice = Math.floor(Math.random() * 1000) + 10;

          prices.push({
            source_centerId: source._id,
            target_centerId: target._id,
            serviceTypeId: service._id,
            typeParcelId: typeParcel._id,
            price: randomPrice,
          });
        }
      }
    }
  }

  // إدخال فقط القيم الجديدة
  await Price.insertMany(prices);

  res.status(201).json({
    status: 'success',
    insertedCount: prices.length,
    data: prices,
  });
});
