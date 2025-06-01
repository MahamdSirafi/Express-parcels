const Shipment = require('../models/shipmentModel');
const AppError = require('../utils/appError');
const StorageOperations = require('../models/storageOperationsModel');
const Parcel = require('../models/parcelModel');
const handlerFactory = require('../utils/handlerFactory');
const catchAsync = require('../utils/catchAsync');
const { status } = require('../utils/enum');
exports.getShipment = handlerFactory.getOne(Shipment);
exports.createShipment = catchAsync(async (req, res, next) => {
  req.body.source_centerId = req.user.centerId;
  const latitude = (Math.random() * 5 + 32).toFixed(6);
  const longitude = (Math.random() * 7 + 35).toFixed(6);
  req.body.current_location = { longitude, latitude };
  const doc = await Shipment.create(req.body);
  res.status(201).json({
    status: 'success',
    doc,
  });
});
exports.updateShipment = handlerFactory.updateOne(Shipment);
exports.deleteShipment = handlerFactory.deleteOne(Shipment);
exports.getAllShipment = handlerFactory.getAll(Shipment);

exports.addParcelToShipment = async (req, res, next) => {
  try {
    const { shipmentId, parcelId } = req.body;

    // Find the shipment
    const shipment = await Shipment.findById(shipmentId);
    if (!shipment) {
      return res.status(404).json({ message: 'Shipment not found' });
    }

    // Find the parcel
    const thisParcel = await Parcel.findById(parcelId);
    if (!thisParcel) {
      return res.status(404).json({ message: 'Parcel not found' });
    }

    // Update parcel status
    thisParcel.status = 'Indelivery';
    await thisParcel.save();

    // Add parcel to shipment
    shipment.parcelId.push(parcelId);
    await shipment.save();

    // Update storage operation for the parcel
    await StorageOperations.findOneAndUpdate(
      { parcelId },
      { timeOut: new Date() },
      { new: true },
    );

    res.status(200).json({
      status: 'success',
      message: 'Parcel added to shipment and storage operation updated',
    });
  } catch (err) {
    next(err);
  }
};
// Update shipment status to 'delivered' and create new storage operations

exports.deliverShipment = async (req, res, next) => {
  try {
    const { shipmentId } = req.body;

    // Check if shipment exists
    const shipment = await Shipment.findById(shipmentId);
    if (!shipment) {
      return res.status(404).json({ message: 'Shipment not found' });
    }

    // Update shipment status to 'delivered'
    shipment.status = 'delivered';
    await shipment.save();

    // Create new storage operations for each parcel
    const storageOperations = shipment.parcelId.map((parcelId) => ({
      parcelId,
      centerId: req.user.centerId,
      timeOut: null, // operation starts now
    }));

    await StorageOperations.insertMany(storageOperations);

    res.status(200).json({
      status: 'success',
      message: 'Shipment delivered and storage operations created',
    });
  } catch (err) {
    next(err);
  }
};

exports.getAllShipmentFree = catchAsync(async (req, res, next) => {
  const doc = await Shipment.find({
    source_centerId: req.user.centerId,
    status: 'packing',
  });
  res.status(200).json({
    status: 'success',
    results: doc.length,
    doc,
  });
});

exports.getAllShipmentOutforpcaking = catchAsync(async (req, res, next) => {
  const doc = await Shipment.find({
    target_centerId: req.user.centerId,
    status: 'indelivery',
  });
  res.status(200).json({
    status: 'success',
    results: doc.length,
    doc,
  });
});
