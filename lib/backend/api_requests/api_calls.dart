import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GoldPriceCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Gold Price',
      apiUrl: 'https://www.goldapi.io/api/XAU/INR',
      callType: ApiCallType.GET,
      headers: {
        'x-access-token': 'goldapi-f82cu2slurzazu4-io',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static double? price(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.price_gram_24k''',
      ));
  static double? openPrice(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.open_price''',
      ));
  static double? lowPrice(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.low_price''',
      ));
  static double? highPrice(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.high_price''',
      ));
  static double? currentPrice(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.price''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
