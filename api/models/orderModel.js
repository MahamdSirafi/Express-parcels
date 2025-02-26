const mongoose = require('mongoose');
const orderSchema = new mongoose.Schema(
  {
    // <creating-property-schema />
    source_lactionId: {
      type: mongoose.Schema.ObjectId,
      ref: 'ServiceConters',
      required: [true, 'Please enter name  source_laction'],
    },
    userId: {
      type: mongoose.Schema.ObjectId,
      ref: 'User',
      required: [true, 'Please enter name  user'],
    },
  },
  { timestamps: true, versionKey: false },
);
// <creating-function-schema />
orderSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'source_lactionId',
    select: '-_id',
  });
  next();
});
orderSchema.pre(/^find/, function (next) {
  this.populate({
    path: 'userId',
    select: '-_id',
  });
  next();
});
const Order = mongoose.model('Order', orderSchema);
module.exports = Order;
