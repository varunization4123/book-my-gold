// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:razorpay_flutter/razorpay_flutter.dart';

// Initialize Razorpay instance globally
late Razorpay _razorpay;

Future openCheckout(
  int amount,
  String razorpayKey,
  String mobileNumber,
  String email,
  String orderId,
) async {
  // Initialize Razorpay instance if not already initialized
  // ignore: unnecessary_null_comparison
  if (_razorpay == null) {
    _razorpay = Razorpay();
  }

  // Define event handlers for Razorpay
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success logic
    print('Payment Success: ${response.paymentId}');
    // You can send payment confirmation to your backend here
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment error logic
    print('Payment Error: ${response.code} - ${response.message}');
    // Notify the user about the error
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet selection
    print('External Wallet: ${response.walletName}');
    // You might want to handle external wallet cases here
  }

  // Assign the event handlers to Razorpay
  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  // Open Razorpay checkout with provided options
  var options = {
    'key': razorpayKey, // Your Razorpay API key
    'amount':
        amount, // Amount in the smallest currency unit (e.g., 1000 paise = 10 INR)
    'name':
        'Your Business Name', // Optional: Your business name or other relevant information
    'description': 'Test Payment', // Optional: Description of the payment
    'order_id': orderId, // The order ID created on your backend
    'prefill': {
      'contact': mobileNumber,
      'email': email,
    },
    'theme': {
      'color': '#FF0000', // Optional: Customize the theme color
    },
  };

  try {
    _razorpay.open(options);
  } catch (e) {
    print('Error opening Razorpay checkout: ${e.toString()}');
    // Handle any errors that might occur while opening the checkout
  }
}
