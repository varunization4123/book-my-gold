// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart' as crypto;
import 'package:encrypt/encrypt.dart' as encrypt;

String encryptBuyVerifyApiRequest(
    String rateId, String goldAmount, String buyPrice, String accessToken) {
  Map<String, String> data = {
    "rate_id": "$rateId",
    "gold_amount": "$goldAmount",
    "buy_price": "$buyPrice"
  };
  print('Input Data: $data');
  try {
    // Generate key from access token
    final keyBytes = crypto.md5.convert(utf8.encode(accessToken)).bytes;
    final key = base64.encode(keyBytes);

    // Generate random IV
    final random = Random.secure();
    final ivBytes = List<int>.generate(16, (_) => random.nextInt(256));
    final iv = base64.encode(ivBytes);

    // Convert data to JSON string
    final jsonData = json.encode(data);

    // Pad the data
    final padded = _pkcs7Pad(jsonData, 16);

    // Encrypt
    final encrypter = encrypt.Encrypter(
        encrypt.AES(encrypt.Key.fromBase64(key), mode: encrypt.AESMode.cbc));
    final encrypted = encrypter.encrypt(padded, iv: encrypt.IV.fromBase64(iv));

    // Combine IV and encrypted data
    final combined = iv + encrypted.base64;

    return json.encode({'data': combined});
  } catch (e) {
    print('API Encryption failed: $e');
    return json.encode({'error': 'Encryption failed: $e'});
  }
}

String _pkcs7Pad(String data, int blockSize) {
  final padLength = blockSize - (data.length % blockSize);
  final padding = String.fromCharCode(padLength) * padLength;
  return data + padding;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
