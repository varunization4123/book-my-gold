import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _phoneNumber =
          await secureStorage.getString('ff_phoneNumber') ?? _phoneNumber;
    });
    await _safeInitAsync(() async {
      _biometricEnabled = await secureStorage.getBool('ff_biometricEnabled') ??
          _biometricEnabled;
    });
    await _safeInitAsync(() async {
      _userRef = (await secureStorage.getString('ff_userRef'))?.ref ?? _userRef;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) {
    _phoneNumber = value;
    secureStorage.setString('ff_phoneNumber', value);
  }

  void deletePhoneNumber() {
    secureStorage.delete(key: 'ff_phoneNumber');
  }

  bool _biometricEnabled = false;
  bool get biometricEnabled => _biometricEnabled;
  set biometricEnabled(bool value) {
    _biometricEnabled = value;
    secureStorage.setBool('ff_biometricEnabled', value);
  }

  void deleteBiometricEnabled() {
    secureStorage.delete(key: 'ff_biometricEnabled');
  }

  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? value) {
    _userRef = value;
    value != null
        ? secureStorage.setString('ff_userRef', value.path)
        : secureStorage.remove('ff_userRef');
  }

  void deleteUserRef() {
    secureStorage.delete(key: 'ff_userRef');
  }

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

  final _previousTransactionQueryManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> previousTransactionQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _previousTransactionQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPreviousTransactionQueryCache() =>
      _previousTransactionQueryManager.clear();
  void clearPreviousTransactionQueryCacheKey(String? uniqueKey) =>
      _previousTransactionQueryManager.clearRequest(uniqueKey);
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
