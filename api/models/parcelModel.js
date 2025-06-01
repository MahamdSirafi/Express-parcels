const { statusParcel } = require('../utils/enum');
const { payment_method } = require('../utils/enum');
const mongoose = require('mongoose');
const parcelSchema = new mongoose.Schema(
  {
    // <creating-property-schema />
    receive: {
      // <creating-property-object-receive />
      contact: {
        type: String,
        required: [true, 'Please enter name  fullName'],
      },
      fullName: {
        type: String,
        required: [true, 'Please enter name  fullName'],
      },
    },
    descrtion: {
      type: String,
      required: [true, 'Please enter name  descrtion'],
    },
    serviceTypeId: {
      type: mongoose.Schema.ObjectId,
      ref: 'ServiceType',
      required: [true, 'Please enter name  serviceType'],
    },
    status: {
      type: String,
      enum: Object.values(statusParcel),
      default: 'Inprocess',
    },
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
      ref: 'ServiceCenters',
      required: [true, 'Please enter name  source_center'],
    },
    userId: {
      type: mongoose.Schema.ObjectId,
      ref: 'User',
      required: [true, 'Please enter name  user'],
    },
    typeparcelId: {
      type: mongoose.Schema.ObjectId,
      ref: 'TypeParcel',
      required: [true, 'Please enter name  typeparcel'],
    },
  },
  { timestamps: true, versionKey: false },
);
// <creating-function-schema />

parcelSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'serviceTypeId',
    select: 'name',
  });
  next();
});

parcelSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'target_centerId',
    select: 'name -_id ',
  });
  next();
});
parcelSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'source_centerId',
    select: 'name -_id ',
  });
  next();
});
parcelSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'userId',
    select: 'fullName -_id ',
  });
  next();
});
parcelSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'typeparcelId',
    select: 'name -_id ',
  });
  next();
});
const Parcel = mongoose.model('Parcel', parcelSchema);
module.exports = Parcel;
