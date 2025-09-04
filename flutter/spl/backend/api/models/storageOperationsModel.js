const mongoose = require('mongoose');
const storageOperationsSchema = new mongoose.Schema(
  {
    // <creating-property-schema />
    timeOut: {
      type: Date,
      default: null,
    },
    parcelId: {
      type: mongoose.Schema.ObjectId,
      ref: 'Parcel',
      required: [true, 'Please enter name  parcel'],
    },
    centerId: {
      type: mongoose.Schema.ObjectId,
      ref: 'ServiceCenters',
      required: [true, 'Please enter name  center'],
    },
  },
  { timestamps: true, versionKey: false },
);
// <creating-function-schema />

storageOperationsSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'parcelId',
  });
  next();
});
storageOperationsSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'centerId',
    select: '-_id',
  });
  next();
});
const storageOperations = mongoose.model('StorageOperations', storageOperationsSchema);
module.exports = storageOperations;