const mongoose = require('mongoose');
const orderSchema = new mongoose.Schema(
  {
    // <creating-property-schema />
    confirmed: {
      type: Boolean,
      required: [true, 'Please enter name  confirmed'],
    },
    order_status: {
      type: String,
      required: [true, 'Please enter name  order_status'],
    },
    payment_method: {
      type: String,
      required: [true, 'Please enter name  payment_method'],
    },
    tolal_price: {
      type: Number,
      required: [true, 'Please enter totle price'],
    },
    item: [
      {
        // <creating-property-object-item />
        type: {
          type: String,
          required: [true, 'Please enter name  type'],
        },
        image_url: {
          type: String,
          required: [true, 'Please enter name  image_url'],
        },
        is_fragile: {
          type: Boolean,
          required: [true, 'Please enter name  is_fragile'],
        },
        weight: {
          type: Number,
          required: [true, 'Please enter name  weight'],
        },
        description: {
          type: String,
          required: [true, 'Please enter name  description'],
        },
        item_name: {
          type: String,
          required: [true, 'Please enter name  item_name'],
        },
      },
    ],
    name: {
      type: String,
    },
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
