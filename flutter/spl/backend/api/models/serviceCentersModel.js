const mongoose = require('mongoose');
const serviceCentersSchema = new mongoose.Schema(
  {
    // <creating-property-schema />
    services_offered: [
      {
        type: String,
        required: [true, 'Please enter name  services_offered'],
      },
    ],
    special_instructions: {
      type: String,
      required: [true, 'Please enter name  special_instructions'],
    },
    operating_hours: [
      {
        // <creating-property-object-operating_hours />
        end: {
          type: String,
          required: [true, 'Please enter name  end'],
        },
        start: {
          type: String,
          required: [true, 'Please enter name  start'],
        },
        day: {
          type: String,
          required: [true, 'Please enter name  day'],
        },
      },
    ],
    phone: {
      type: String,
      required: [true, 'Please enter name  phone'],
    },
    address: {
      // <creating-property-object-address />
      zip: {
        type: String,
        required: [true, 'Please enter name  zip'],
      },
      city: {
        type: String,
        required: [true, 'Please enter name  city'],
      },
      street: {
        type: String,
        required: [true, 'Please enter name  street'],
      },
    },
    name: {
      type: String,
      required: [true, 'Please enter name  name'],
    },
  },
  { timestamps: true, versionKey: false },
);
// <creating-function-schema />

const ServiceCenters = mongoose.model('ServiceCenters', serviceCentersSchema);
module.exports = ServiceCenters;
