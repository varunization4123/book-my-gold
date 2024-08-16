import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'allThatGlowsAintGlitter';

/// Start SafeGold API Group Group Code

class SafeGoldAPIGroupGroup {
  static String getBaseUrl() => 'https://partners-staging.safegold.com';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
    'Accept': 'application/json',
  };
  static BuyPriceAPICall buyPriceAPICall = BuyPriceAPICall();
  static BuyVerifyAPICall buyVerifyAPICall = BuyVerifyAPICall();
  static RegistrationAPICall registrationAPICall = RegistrationAPICall();
  static SellPriceAPICall sellPriceAPICall = SellPriceAPICall();
  static UserTransactionsAPICall userTransactionsAPICall =
      UserTransactionsAPICall();
  static FetchBalanceAPICall fetchBalanceAPICall = FetchBalanceAPICall();
  static InvoiceAPICall invoiceAPICall = InvoiceAPICall();
  static SellStatusAPICall sellStatusAPICall = SellStatusAPICall();
  static HistoricalPricesIntervalOfHalfHourCall
      historicalPricesIntervalOfHalfHourCall =
      HistoricalPricesIntervalOfHalfHourCall();
  static HistoricalPricesDailyRateCall historicalPricesDailyRateCall =
      HistoricalPricesDailyRateCall();
  static BuyConfirmAPICall buyConfirmAPICall = BuyConfirmAPICall();
  static SellVerifyAPICall sellVerifyAPICall = SellVerifyAPICall();
  static SellConfirmAPICall sellConfirmAPICall = SellConfirmAPICall();
  static KYCUpdateAPICall kYCUpdateAPICall = KYCUpdateAPICall();
  static UpdationOfMobileNumberCall updationOfMobileNumberCall =
      UpdationOfMobileNumberCall();
  static BuyStatusAPICall buyStatusAPICall = BuyStatusAPICall();
}

class BuyPriceAPICall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Buy Price API',
      apiUrl: '$baseUrl/v1/buy-price',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuyVerifyAPICall {
  Future<ApiCallResponse> call({
    int? userId = 334180,
    String? encryptedData = '',
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
$encryptedData''';
    return ApiManager.instance.makeApiCall(
      callName: 'Buy Verify API',
      apiUrl: '$baseUrl/v4/users/$userId/buy-gold-verify',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegistrationAPICall {
  Future<ApiCallResponse> call({
    String? name = '',
    int? mobileNo,
    String? email = '',
    int? pinCode,
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "$name",
  "mobile_no": "$mobileNo",
  "email": "$email",
  "pin_code": "000000"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Registration API',
      apiUrl: '$baseUrl/v1/users',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SellPriceAPICall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Sell Price API',
      apiUrl: '$baseUrl/v1/sell-price',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserTransactionsAPICall {
  Future<ApiCallResponse> call({
    int? userId,
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User Transactions API',
      apiUrl: '$baseUrl/v1/users/$userId/transactions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchBalanceAPICall {
  Future<ApiCallResponse> call({
    int? userId,
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Balance API',
      apiUrl: '$baseUrl/v1/users/$userId',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InvoiceAPICall {
  Future<ApiCallResponse> call({
    int? txId,
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Invoice API',
      apiUrl: '$baseUrl/v1/transactions/$txId/fetch-invoice',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SellStatusAPICall {
  Future<ApiCallResponse> call({
    int? txId,
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Sell Status API',
      apiUrl: '$baseUrl/v1/sell-gold/$txId/order-status',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HistoricalPricesIntervalOfHalfHourCall {
  Future<ApiCallResponse> call({
    String? fromDate = '24-07-30',
    String? toDate = '24-07-30',
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Historical Prices Interval of Half Hour',
      apiUrl:
          '$baseUrl/v1/gold/historical-data?from_date=$fromDate&to_date=$toDate',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HistoricalPricesDailyRateCall {
  Future<ApiCallResponse> call({
    String? fromDate = '24-07-30',
    String? toDate = '24-07-20',
    String? t = 'd',
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Historical Prices Daily rate',
      apiUrl:
          '$baseUrl/v1/gold/historical?from_date=$fromDate&to_date=$toDate&type=$t',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuyConfirmAPICall {
  Future<ApiCallResponse> call({
    int? userId,
    String? encryptedData = '',
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
$encryptedData''';
    return ApiManager.instance.makeApiCall(
      callName: 'Buy Confirm API',
      apiUrl: '$baseUrl/v1/users/$userId/buy-gold-confirm',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SellVerifyAPICall {
  Future<ApiCallResponse> call({
    int? userId,
    String? encryptedData = '',
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
$encryptedData''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sell Verify API',
      apiUrl: '$baseUrl/v4/users/$userId/sell-gold-verify',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SellConfirmAPICall {
  Future<ApiCallResponse> call({
    int? userId,
    String? encryptedData = '',
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
$encryptedData''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sell Confirm API',
      apiUrl: '$baseUrl/v1/users/$userId/sell-gold-confirm',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class KYCUpdateAPICall {
  Future<ApiCallResponse> call({
    int? userId,
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'KYC Update API',
      apiUrl: '$baseUrl/v1/users/$userId/kyc-update',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdationOfMobileNumberCall {
  Future<ApiCallResponse> call({
    int? userId,
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Updation of Mobile Number',
      apiUrl: '$baseUrl/v1/users/$userId/direct-update-phone-no',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuyStatusAPICall {
  Future<ApiCallResponse> call({
    int? txId,
  }) async {
    final baseUrl = SafeGoldAPIGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Buy Status API',
      apiUrl: '$baseUrl/v1/buy-gold/$txId/order-status',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer c5a967bb7aad36f120dcbc58c7ea666d',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SafeGold API Group Group Code

/// Start Razorpay API Group Group Code

class RazorpayAPIGroupGroup {
  static String getBaseUrl() => 'https://api.razorpay.com';
  static Map<String, String> headers = {
    'Content-type': 'application/json',
    'Authorization':
        'Basic cnpwX3Rlc3RfMldlN0V5cTdOZEtRZ2Q6SzFRMGF5aWNjdkI3SlVRemRiUVQyQlRF',
  };
  static PlanCall planCall = PlanCall();
  static SubscriptionCall subscriptionCall = SubscriptionCall();
  static OrdersCall ordersCall = OrdersCall();
  static CapturePaymentCall capturePaymentCall = CapturePaymentCall();
  static CreateCustomerCall createCustomerCall = CreateCustomerCall();
}

class PlanCall {
  Future<ApiCallResponse> call({
    int? amount = 100,
    String? type = 'daily',
  }) async {
    final baseUrl = RazorpayAPIGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "period": "$type",
  "interval": 3650,
  "item": {
    "name": "Test plan - Daily",
    "amount": $amount,
    "currency": "INR",
    "description": "Description for the test plan - Weekly"
  },
  "notes": {
    "notes_key_1": "Tea, Earl Grey, Hot",
    "notes_key_2": "Tea, Earl Grey… decaf."
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Plan',
      apiUrl: '$baseUrl/v1/plans',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization':
            'Basic cnpwX3Rlc3RfMldlN0V5cTdOZEtRZ2Q6SzFRMGF5aWNjdkI3SlVRemRiUVQyQlRF',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionCall {
  Future<ApiCallResponse> call({
    String? planId = 'plan_Ok5PUFk7CncKLW',
    int? totalCount = 10,
    String? customerId = '',
  }) async {
    final baseUrl = RazorpayAPIGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "plan_id": "$planId",
  "total_count": $totalCount,
  "customer_id": "$customerId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Subscription',
      apiUrl: '$baseUrl/v1/subscriptions',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization':
            'Basic cnpwX3Rlc3RfMldlN0V5cTdOZEtRZ2Q6SzFRMGF5aWNjdkI3SlVRemRiUVQyQlRF',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OrdersCall {
  Future<ApiCallResponse> call({
    int? amount = 100,
  }) async {
    final baseUrl = RazorpayAPIGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "amount": $amount,
  "currency": "INR"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Orders',
      apiUrl: '$baseUrl/v1/orders',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization':
            'Basic cnpwX3Rlc3RfMldlN0V5cTdOZEtRZ2Q6SzFRMGF5aWNjdkI3SlVRemRiUVQyQlRF',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CapturePaymentCall {
  Future<ApiCallResponse> call({
    String? orderId = '37269747-218eada9-5aff-47ca-a4fd-77e582a93714',
    int? amount = 100,
    String? subscriptionId = 'sub_Ok5Qiug0mqZdsk',
  }) async {
    final baseUrl = RazorpayAPIGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "amount": $amount,
  "currency": "INR",
  "subscription_id": "$subscriptionId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Capture Payment',
      apiUrl: '$baseUrl/v1/payments/$orderId/capture',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization':
            'Basic cnpwX3Rlc3RfMldlN0V5cTdOZEtRZ2Q6SzFRMGF5aWNjdkI3SlVRemRiUVQyQlRF',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateCustomerCall {
  Future<ApiCallResponse> call({
    String? userName = 'Varun Kuntoor',
    String? contact = '+919902654831',
    String? email = 'varunization@gmail.com',
  }) async {
    final baseUrl = RazorpayAPIGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "$userName",
  "email": "$email",
  "contact": "$contact",
  "fail_existing": "0"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Customer',
      apiUrl: '$baseUrl/v1/customers',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization':
            'Basic cnpwX3Rlc3RfMldlN0V5cTdOZEtRZ2Q6SzFRMGF5aWNjdkI3SlVRemRiUVQyQlRF',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Razorpay API Group Group Code

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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
