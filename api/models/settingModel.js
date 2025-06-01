const mongoose = require('mongoose');
const settingSchema = new mongoose.Schema(
  {
    // <creating-property-schema />
    price: {
      type: Number,
      required: [true, 'Please enter name  price'],
    },
    typeParcelId: {
      type: mongoose.Schema.ObjectId,
      ref: 'TypeParcel',
      required: [true, 'Please enter name  TypeParcelId'],
    },
    serviceTypeId: {
      type: mongoose.Schema.ObjectId,
      ref: 'ServiceType',
      required: [true, 'Please enter name  serviceTypeId'],
    },
    source_centerId: {
      type: mongoose.Schema.ObjectId,
      ref: 'ServiceCenters',
      required: [true, 'Please enter name  source_centerId'],
    },
    target_centerId: {
      type: mongoose.Schema.ObjectId,
      ref: 'ServiceCenters',
      required: [true, 'Please enter name  target_centerId'],
    },
  },
  { timestamps: true, versionKey: false },
);
// <creating-function-schema />

const Setting = mongoose.model('Setting', settingSchema);
module.exports = Setting;
