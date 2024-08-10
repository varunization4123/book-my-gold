import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic jsonFromString(String decrypted) {
  final jsonData = jsonDecode(decrypted);

  return jsonData;
}

String sellConfirmData(String txId) {
  return '{"tx_id":"$txId"}';
}

String buyConfirmData(
  String txId,
  String pincode,
) {
  return '{"tx_id":"$txId","pincode":"$pincode"}';
}

String sellVerifyData(
  String rateId,
  String sellPrice,
  String goldAmount,
) {
  return '{"rate_id":"$rateId","sell_price":"$sellPrice","gold_amount":"$goldAmount"}';
}

List<int> xAxisList(List<dynamic> data) {
  if (data.isEmpty) {
    return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
  }
  return List<int>.generate(data.length, (index) => index);
}

List<double> yAxisList(List<dynamic> data) {
  if (data.isEmpty) {
    return [
      5797.48,
      5845.99,
      5963.23,
      5990.3,
      6023.23,
      6165.65,
      6100.6,
      6199.98,
      6232.2,
      6584.8,
      6323.2,
      6119.9,
      6060.6,
      5996.32,
      5990.32,
      6340.6,
      6890.6
    ];
  }

  return data.map((item) {
    try {
      return double.parse(item['rate'].toString());
    } catch (e) {
      print('Error parsing rate: ${item['rate']}');
      return 0.0; // Default value if parsing fails
    }
  }).toList();
}

String buyVerifyData(
  String rateId,
  String buyPrice,
  String goldAmount,
) {
  return '{"rate_id":"$rateId","buy_price":"$buyPrice","gold_amount":"$goldAmount"}';
}

List<String> splitDateTimeString(String? dateTimeString) {
// Check if the input string is empty or null
  if (dateTimeString == null || dateTimeString.isEmpty) {
    return ['', '']; // Return empty strings if input is invalid
  }

  // Split the string by space
  List<String> parts = dateTimeString.split(' ');

  // Check if we have exactly two parts
  if (parts.length != 2) {
    return ['', '']; // Return empty strings if format is incorrect
  }

  String datePart = parts[0]; // "2021-05-28"
  String timePart = parts[1]; // "13:38:32"

  // You can add additional validation here if needed
  // For example, checking if the date and time are in the correct format

  // Return the result as a List
  return [datePart, timePart];
}
