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

double? doubleRounding(
  double goldPrice,
  double enteredAmount,
) {
  double d = (goldPrice - (goldPrice * 0.01)) * enteredAmount;
  String prettify = d.toStringAsFixed(2).replaceFirst(RegExp(r'\\.?0*$'), '');
  return double.parse(prettify);
}
