const { status } = require('../utils/enum');
const { payment_method } = require('../utils/enum');
const mongoose = require('mongoose');
const parcelSchema = new mongoose.Schema(
  {
    // <creating-property-schema />
    status: [
      {
        type: String,
        enum: Object.values(status),
      },
    ],
    payment_method: {
      type: String,
      enum: Object.values(payment_method),
    },
    price: {
      type: Number,
      required: [true, 'Please enter name  price'],
    },
    target_centerId: {
      type: mongoose.Schema.ObjectId,
      ref: 'ServiceCenters',
      required: [true, 'Please enter name  target_center'],
    },
    source_centerId: {
      type: mongoose.Schema.ObjectId,
      ref: 'ServiceCenter',
      required: [true, 'Please enter name  source_center'],
    },
    userId: {
      type: mongoose.Schema.ObjectId,
      ref: 'User',
      required: [true, 'Please enter name  user'],
    },
    typeparcelId: {
      type: mongoose.Schema.ObjectId,
      ref: 'Typeparcel',
      required: [true, 'Please enter name  typeparcel'],
    },
  },
  { timestamps: true, versionKey: false },
);
// <creating-function-schema />

parcelSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'target_centerId',
    select: '-_id',
  });
  next();
});
parcelSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'source_centerId',
    select: '-_id',
  });
  next();
});
parcelSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'userId',
    select: '-_id',
  });
  next();
});
parcelSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'typeparcelId',
    select: '-_id',
  });
  next();
});
const Parcel = mongoose.model('Parcel', parcelSchema);
module.exports = Parcel;
