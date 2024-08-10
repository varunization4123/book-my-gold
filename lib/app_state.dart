import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
      _userId = await secureStorage.getInt('ff_userId') ?? _userId;
    });
    await _safeInitAsync(() async {
      _xAxis = (await secureStorage.getStringList('ff_xAxis'))
              ?.map(int.parse)
              .toList() ??
          _xAxis;
    });
    await _safeInitAsync(() async {
      _yAxis = (await secureStorage.getStringList('ff_yAxis'))
              ?.map(double.parse)
              .toList() ??
          _yAxis;
    });
    await _safeInitAsync(() async {
      _sellableBalance = await secureStorage.getDouble('ff_sellableBalance') ??
          _sellableBalance;
    });
    await _safeInitAsync(() async {
      _goldBalance =
          await secureStorage.getDouble('ff_goldBalance') ?? _goldBalance;
    });
    await _safeInitAsync(() async {
      _transactions =
          (await secureStorage.getStringList('ff_transactions'))?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _transactions;
    });
    await _safeInitAsync(() async {
      _amountBought =
          await secureStorage.getDouble('ff_amountBought') ?? _amountBought;
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

  String _safeGoldAccessToken = 'c5a967bb7aad36f120dcbc58c7ea666d';
  String get safeGoldAccessToken => _safeGoldAccessToken;
  set safeGoldAccessToken(String value) {
    _safeGoldAccessToken = value;
  }

  String _buyPrice = '6000';
  String get buyPrice => _buyPrice;
  set buyPrice(String value) {
    _buyPrice = value;
  }

  int _userId = 0;
  int get userId => _userId;
  set userId(int value) {
    _userId = value;
    secureStorage.setInt('ff_userId', value);
  }

  void deleteUserId() {
    secureStorage.delete(key: 'ff_userId');
  }

  String _sellPrice = '6000';
  String get sellPrice => _sellPrice;
  set sellPrice(String value) {
    _sellPrice = value;
  }

  List<dynamic> _goldData = [];
  List<dynamic> get goldData => _goldData;
  set goldData(List<dynamic> value) {
    _goldData = value;
  }

  void addToGoldData(dynamic value) {
    goldData.add(value);
  }

  void removeFromGoldData(dynamic value) {
    goldData.remove(value);
  }

  void removeAtIndexFromGoldData(int index) {
    goldData.removeAt(index);
  }

  void updateGoldDataAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    goldData[index] = updateFn(_goldData[index]);
  }

  void insertAtIndexInGoldData(int index, dynamic value) {
    goldData.insert(index, value);
  }

  List<int> _xAxis = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  List<int> get xAxis => _xAxis;
  set xAxis(List<int> value) {
    _xAxis = value;
    secureStorage.setStringList(
        'ff_xAxis', value.map((x) => x.toString()).toList());
  }

  void deleteXAxis() {
    secureStorage.delete(key: 'ff_xAxis');
  }

  void addToXAxis(int value) {
    xAxis.add(value);
    secureStorage.setStringList(
        'ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void removeFromXAxis(int value) {
    xAxis.remove(value);
    secureStorage.setStringList(
        'ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromXAxis(int index) {
    xAxis.removeAt(index);
    secureStorage.setStringList(
        'ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void updateXAxisAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    xAxis[index] = updateFn(_xAxis[index]);
    secureStorage.setStringList(
        'ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInXAxis(int index, int value) {
    xAxis.insert(index, value);
    secureStorage.setStringList(
        'ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  List<double> _yAxis = [];
  List<double> get yAxis => _yAxis;
  set yAxis(List<double> value) {
    _yAxis = value;
    secureStorage.setStringList(
        'ff_yAxis', value.map((x) => x.toString()).toList());
  }

  void deleteYAxis() {
    secureStorage.delete(key: 'ff_yAxis');
  }

  void addToYAxis(double value) {
    yAxis.add(value);
    secureStorage.setStringList(
        'ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void removeFromYAxis(double value) {
    yAxis.remove(value);
    secureStorage.setStringList(
        'ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromYAxis(int index) {
    yAxis.removeAt(index);
    secureStorage.setStringList(
        'ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void updateYAxisAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    yAxis[index] = updateFn(_yAxis[index]);
    secureStorage.setStringList(
        'ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInYAxis(int index, double value) {
    yAxis.insert(index, value);
    secureStorage.setStringList(
        'ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  double _sellableBalance = 0.0;
  double get sellableBalance => _sellableBalance;
  set sellableBalance(double value) {
    _sellableBalance = value;
    secureStorage.setDouble('ff_sellableBalance', value);
  }

  void deleteSellableBalance() {
    secureStorage.delete(key: 'ff_sellableBalance');
  }

  double _goldBalance = 0.0;
  double get goldBalance => _goldBalance;
  set goldBalance(double value) {
    _goldBalance = value;
    secureStorage.setDouble('ff_goldBalance', value);
  }

  void deleteGoldBalance() {
    secureStorage.delete(key: 'ff_goldBalance');
  }

  List<dynamic> _transactions = [];
  List<dynamic> get transactions => _transactions;
  set transactions(List<dynamic> value) {
    _transactions = value;
    secureStorage.setStringList(
        'ff_transactions', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteTransactions() {
    secureStorage.delete(key: 'ff_transactions');
  }

  void addToTransactions(dynamic value) {
    transactions.add(value);
    secureStorage.setStringList(
        'ff_transactions', _transactions.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTransactions(dynamic value) {
    transactions.remove(value);
    secureStorage.setStringList(
        'ff_transactions', _transactions.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTransactions(int index) {
    transactions.removeAt(index);
    secureStorage.setStringList(
        'ff_transactions', _transactions.map((x) => jsonEncode(x)).toList());
  }

  void updateTransactionsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    transactions[index] = updateFn(_transactions[index]);
    secureStorage.setStringList(
        'ff_transactions', _transactions.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTransactions(int index, dynamic value) {
    transactions.insert(index, value);
    secureStorage.setStringList(
        'ff_transactions', _transactions.map((x) => jsonEncode(x)).toList());
  }

  double _amountBought = 0.0;
  double get amountBought => _amountBought;
  set amountBought(double value) {
    _amountBought = value;
    secureStorage.setDouble('ff_amountBought', value);
  }

  void deleteAmountBought() {
    secureStorage.delete(key: 'ff_amountBought');
  }
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
