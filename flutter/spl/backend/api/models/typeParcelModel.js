const mongoose = require('mongoose');
const typeParcelSchema = new mongoose.Schema(
  {
    // <creating-property-schema />
    image: {
      type: String,
      required: [true, 'Please enter name  image'],
    },
    price: {
      type: Number,
      required: [true, 'Please enter name  price'],
    },
    description: {
      type: String,
      required: [true, 'Please enter name  description'],
    },
    width: {
      type: Number,
      required: [true, 'Please enter name  width'],
    },
    hight: {
      type: Number,
      required: [true, 'Please enter name  hight'],
    },
    name: {
      type: String,
      required: [true, 'Please enter name  name'],
    },
  },
  { timestamps: true, versionKey: false },
);
// <creating-function-schema />

const TypeParcel = mongoose.model('TypeParcel', typeParcelSchema);
module.exports = TypeParcel;
