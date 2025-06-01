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
        required: [true, 'Please enter longitude'],
      },
      latitude: {
        type: Number,
        required: [true, 'Please enter latitude'],
      },
    },
    source_centerId: {
      type: mongoose.Schema.ObjectId,
      ref: 'ServiceCenters',
      required: [true, 'Please enter name  source_centerIdId'],
    },
    description: {
      type: String,
      required: [true, 'Please enter  description'],
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
        required: [true, 'Please provide a parcel ID'],
      },
    ],
  },
  { timestamps: true, versionKey: false },
);
// <creating-function-schema />

shipmentSchema.pre(/^find/, function (next) {
  this.populate([
    { path: 'source_centerId', select: 'name -_id' },
    { path: 'target_centerId', select: 'name -_id' },
    { path: 'parcelId', select: '-_id' },
  ]);
  next();
});

const Shipment = mongoose.model('Shipment', shipmentSchema);
module.exports = Shipment;
