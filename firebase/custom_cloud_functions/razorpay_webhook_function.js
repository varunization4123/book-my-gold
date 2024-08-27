const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const crypto = require("crypto");
const bodyParser = require("body-parser");
const express = require("express");

const app = express();
// Middleware to parse JSON bodies
app.use(bodyParser.json());

const WEBHOOK_SECRET = "BuG$2479";

exports.razorpayWebhookFunction = functions.https.onCall((data, context) => {
  if (!context.auth.uid) {
    return;
  }
  // Write your code below!
  // Verify the webhook signature
  function verifySignature(payload, signature, secret) {
    const hmac = crypto.createHmac("sha256", secret);
    hmac.update(payload);
    const digest = hmac.digest("hex");
    return digest === signature;
  }

  app.post("/webhook", (req, res) => {
    const payload = JSON.stringify(req.body);
    const signature = req.headers["x-razorpay-signature"];

    if (!verifySignature(payload, signature, WEBHOOK_SECRET)) {
      return res.status(400).send("Invalid signature");
    }

    const event = req.body;

    // Handle different event types from Razorpay
    switch (event.event) {
      case "payment.captured":
        // Handle payment success
        console.log("Payment captured:", event.payload.entity);
        break;
      case "subscription.created":
        // Handle subscription creation
        console.log("Subscription created:", event.payload.entity);
        break;
      case "subscription.payment.failed":
        // Handle failed payment
        console.log("Subscription payment failed:", event.payload.entity);
        break;
      // Add more cases as needed
      default:
        console.log("Unhandled event:", event.event);
    }

    res.status(200).send("Event received");
  });

  // Export the function
  exports.razorpayWebhookFunction = functions.https.onRequest(app);
  // Write your code above!
});
