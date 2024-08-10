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
import 'package:pointycastle/api.dart' show KeyParameter, SecureRandom;

encrypt.IV generateRandomIV(int length) {
  final secureRandom = SecureRandom('Fortuna')
    ..seed(KeyParameter(Uint8List.fromList(
        List.generate(32, (_) => Random.secure().nextInt(256)))));
  final ivBytes = secureRandom.nextBytes(length);
  return encrypt.IV(ivBytes);
}

String encryptApiRequest(String data, String accessToken) {
  print("data: $data");

  try {
    final String keyString =
        crypto.md5.convert(utf8.encode(accessToken)).toString();
    final key = encrypt.Key.fromUtf8(keyString);

    final iv = generateRandomIV(16);
    print(
        'Generated IV (hex): ${iv.bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join()}');

    //TestData from API Documentation
    //String testVerifyData =
    //    '{"rate_id":"23453469","gold_amount":"1","buy_price":"3170.34"}';
    //print("Testdata: $testVerifyData");

    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final encrypted = encrypter.encrypt(data, iv: iv);
    print('Encrypted Text (base64): ${encrypted.base64}');

    final combined = iv.bytes + encrypted.bytes;
    final cipherText = base64.encode(combined);
    print('Final Cipher Text: $cipherText');

    final jsonData = json.encode({'data': cipherText});
    print("JSON Data: $jsonData");
    return jsonData;
  } catch (e) {
    print('API Encryption failed: $e');
    return json.encode({'error': 'Encryption failed: $e'});
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
