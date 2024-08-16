const admin = require("firebase-admin/app");
admin.initializeApp();

const razorpayWebhookFunction = require("./razorpay_webhook_function.js");
exports.razorpayWebhookFunction =
  razorpayWebhookFunction.razorpayWebhookFunction;
