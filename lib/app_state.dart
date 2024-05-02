import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _phoneNumber = prefs.getString('ff_phoneNumber') ?? _phoneNumber;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) {
    _phoneNumber = value;
    prefs.setString('ff_phoneNumber', value);
  }

  final _lastSavedManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> lastSaved({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _lastSavedManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLastSavedCache() => _lastSavedManager.clear();
  void clearLastSavedCacheKey(String? uniqueKey) =>
      _lastSavedManager.clearRequest(uniqueKey);

  final _transactionsQueryManager =
      FutureRequestManager<List<DigiGoldBuyRecord>>();
  Future<List<DigiGoldBuyRecord>> transactionsQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<DigiGoldBuyRecord>> Function() requestFn,
  }) =>
      _transactionsQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTransactionsQueryCache() => _transactionsQueryManager.clear();
  void clearTransactionsQueryCacheKey(String? uniqueKey) =>
      _transactionsQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
