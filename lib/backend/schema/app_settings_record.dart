import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppSettingsRecord extends FirestoreRecord {
  AppSettingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ad_cost" field.
  int? _adCost;
  int get adCost => _adCost ?? 0;
  bool hasAdCost() => _adCost != null;

  // "commision_fees" field.
  int? _commisionFees;
  int get commisionFees => _commisionFees ?? 0;
  bool hasCommisionFees() => _commisionFees != null;

  // "discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  bool hasDiscount() => _discount != null;

  // "gold_diff_amount" field.
  int? _goldDiffAmount;
  int get goldDiffAmount => _goldDiffAmount ?? 0;
  bool hasGoldDiffAmount() => _goldDiffAmount != null;

  // "gst" field.
  int? _gst;
  int get gst => _gst ?? 0;
  bool hasGst() => _gst != null;

  // "rewards" field.
  int? _rewards;
  int get rewards => _rewards ?? 0;
  bool hasRewards() => _rewards != null;

  // "transaction_fees_buy" field.
  int? _transactionFeesBuy;
  int get transactionFeesBuy => _transactionFeesBuy ?? 0;
  bool hasTransactionFeesBuy() => _transactionFeesBuy != null;

  // "transaction_fees_sell" field.
  int? _transactionFeesSell;
  int get transactionFeesSell => _transactionFeesSell ?? 0;
  bool hasTransactionFeesSell() => _transactionFeesSell != null;

  // "withdraw_hold" field.
  int? _withdrawHold;
  int get withdrawHold => _withdrawHold ?? 0;
  bool hasWithdrawHold() => _withdrawHold != null;

  void _initializeFields() {
    _adCost = castToType<int>(snapshotData['ad_cost']);
    _commisionFees = castToType<int>(snapshotData['commision_fees']);
    _discount = castToType<int>(snapshotData['discount']);
    _goldDiffAmount = castToType<int>(snapshotData['gold_diff_amount']);
    _gst = castToType<int>(snapshotData['gst']);
    _rewards = castToType<int>(snapshotData['rewards']);
    _transactionFeesBuy = castToType<int>(snapshotData['transaction_fees_buy']);
    _transactionFeesSell =
        castToType<int>(snapshotData['transaction_fees_sell']);
    _withdrawHold = castToType<int>(snapshotData['withdraw_hold']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appSettings');

  static Stream<AppSettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppSettingsRecord.fromSnapshot(s));

  static Future<AppSettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppSettingsRecord.fromSnapshot(s));

  static AppSettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppSettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppSettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppSettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppSettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppSettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppSettingsRecordData({
  int? adCost,
  int? commisionFees,
  int? discount,
  int? goldDiffAmount,
  int? gst,
  int? rewards,
  int? transactionFeesBuy,
  int? transactionFeesSell,
  int? withdrawHold,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ad_cost': adCost,
      'commision_fees': commisionFees,
      'discount': discount,
      'gold_diff_amount': goldDiffAmount,
      'gst': gst,
      'rewards': rewards,
      'transaction_fees_buy': transactionFeesBuy,
      'transaction_fees_sell': transactionFeesSell,
      'withdraw_hold': withdrawHold,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppSettingsRecordDocumentEquality implements Equality<AppSettingsRecord> {
  const AppSettingsRecordDocumentEquality();

  @override
  bool equals(AppSettingsRecord? e1, AppSettingsRecord? e2) {
    return e1?.adCost == e2?.adCost &&
        e1?.commisionFees == e2?.commisionFees &&
        e1?.discount == e2?.discount &&
        e1?.goldDiffAmount == e2?.goldDiffAmount &&
        e1?.gst == e2?.gst &&
        e1?.rewards == e2?.rewards &&
        e1?.transactionFeesBuy == e2?.transactionFeesBuy &&
        e1?.transactionFeesSell == e2?.transactionFeesSell &&
        e1?.withdrawHold == e2?.withdrawHold;
  }

  @override
  int hash(AppSettingsRecord? e) => const ListEquality().hash([
        e?.adCost,
        e?.commisionFees,
        e?.discount,
        e?.goldDiffAmount,
        e?.gst,
        e?.rewards,
        e?.transactionFeesBuy,
        e?.transactionFeesSell,
        e?.withdrawHold
      ]);

  @override
  bool isValidKey(Object? o) => o is AppSettingsRecord;
}
