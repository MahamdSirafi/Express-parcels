const { insurance } = require('../utils/enum');
const mongoose = require('mongoose');
const serviceTypeSchema = new mongoose.Schema(
  {
    // <creating-property-schema />
    price: {
      type: Number,
      required: [true, 'Please enter name  price'],
    },
    description: {
      type: String,
      required: [true, 'Please enter name  description'],
    },
    name: {
      type: String,
      required: [true, 'Please enter name  name'],
    },
  },
  { timestamps: true, versionKey: false },
);
// <creating-function-schema />

// serviceTypeSchema.pre(/^find/, function (next) {
//   this.populate({
//     path: 'serviceTypeIds',
//     select: '-_id',
//   });
//   next();
// });

const ServiceType = mongoose.model('ServiceType', serviceTypeSchema);
module.exports = ServiceType;
