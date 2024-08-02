// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:crypto/crypto.dart' as crypto;
import 'dart:convert';

Future<String> decryptApiResponse(String accessToken, String response) async {
  try {
    final String keyString =
        crypto.md5.convert(utf8.encode(accessToken)).toString();

    //1. Key Extraction
    final key = encrypt.Key.fromUtf8(keyString);

    // Getting correct response data
    Map<String, dynamic> responseData;
    try {
      responseData = json.decode(response);
    } catch (e) {
      return '';
    }
    String responseDataAsString = responseData['data'];

    //2. Base 64 Decode
    final encryptedBytesWithIv = base64.decode(responseDataAsString);

    //3. IV Extraction
    final ivBytes = encryptedBytesWithIv.sublist(0, 16);
    final iv = encrypt.IV(ivBytes);

    //4. Encrypted Text Extraction
    final encryptedBytes = encryptedBytesWithIv.sublist(16);
    final encrypted = encrypt.Encrypted(encryptedBytes);

    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    //5. Decryption (Key, IV, Encrypted Text)
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    print('API Data: $decrypted');

    // Validate that the decrypted string is valid JSON
    json.decode(
        decrypted); // This will throw an exception if it's not valid JSON

    // If no exception was thrown, return the decrypted string as is
    return decrypted;
  } catch (e) {
    print('API Decryption failed: $e');
    return '{"error": "Decryption failed or invalid JSON: $e"}';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
