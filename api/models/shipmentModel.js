const { status } = require('../utils/enum');
const mongoose = require('mongoose');
const shipmentSchema = new mongoose.Schema(
  {
    // <creating-property-schema />
    status: {
      type: String,
      enum: Object.values(status),
      default: status.packing,
    },
    current_location: {
      // <creating-property-object-current_location />
      longitude: {
        type: Number,
        required: [true, 'Please enter name  longitude'],
      },
      latitude: {
        type: Number,
        required: [true, 'Please enter name  latitude'],
      },
    },
    source_centerId: {
      type: mongoose.Schema.ObjectId,
      ref: 'ServiceCenters',
      required: [true, 'Please enter name  source_centerIdId'],
    },
    description: {
      type: String,
    },

    target_centerId: {
      type: mongoose.Schema.ObjectId,
      ref: 'ServiceCenters',
      required: [true, 'Please enter name  target_centerId'],
    },
    parcelId: [
      {
        type: mongoose.Schema.ObjectId,
        ref: 'Parcel',
        required: [true, 'Please enter name  parcel'],
      },
    ],
  },
  { timestamps: true, versionKey: false },
);
// <creating-function-schema />


shipmentSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'source_centerId',
    select: 'name -_id',
  });
  next();
});
shipmentSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'target_centerId',
    select: 'name -_id',
  });
  next();
});
shipmentSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'parcelId',
    select: '-_id',
  });
  next();
});
const Shipment = mongoose.model('Shipment', shipmentSchema);
module.exports = Shipment;
