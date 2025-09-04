const mongoose = require('mongoose');
const ratingsSchema = new mongoose.Schema(
  {
    // <creating-property-schema />
    userId: {
      type: mongoose.Schema.ObjectId,
      ref: 'User',
      required: [true, 'Please enter name  user'],
    },
    parcelId: {
      type: mongoose.Schema.ObjectId,
      ref: 'Parcel',
      unique: true,
    },
    comment: {
      type: String,
      required: [true, 'Please enter name  comment'],
    },
    rate: {
      type: Number,
      required: [true, 'Please enter name  rate'],
      max: 5,
      min: 1,
    },
  },
  { timestamps: true, versionKey: false },
);
// <creating-function-schema />
ratingsSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'userId',
    select: '-_id',
  });
  next();
});
ratingsSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'parcelId',
    select: '-_id',
  });
  next();
});

const Ratings = mongoose.model('Ratings', ratingsSchema);
module.exports = Ratings;
