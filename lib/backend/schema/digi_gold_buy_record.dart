import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DigiGoldBuyRecord extends FirestoreRecord {
  DigiGoldBuyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "razorpay_payment_id" field.
  String? _razorpayPaymentId;
  String get razorpayPaymentId => _razorpayPaymentId ?? '';
  bool hasRazorpayPaymentId() => _razorpayPaymentId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "amount" field.
  String? _amount;
  String get amount => _amount ?? '';
  bool hasAmount() => _amount != null;

  // "gold" field.
  String? _gold;
  String get gold => _gold ?? '';
  bool hasGold() => _gold != null;

  // "gold_price" field.
  String? _goldPrice;
  String get goldPrice => _goldPrice ?? '';
  bool hasGoldPrice() => _goldPrice != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _razorpayPaymentId = snapshotData['razorpay_payment_id'] as String?;
    _status = snapshotData['status'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _amount = snapshotData['amount'] as String?;
    _gold = snapshotData['gold'] as String?;
    _goldPrice = snapshotData['gold_price'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('digiGold_buy')
          : FirebaseFirestore.instance.collectionGroup('digiGold_buy');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('digiGold_buy').doc(id);

  static Stream<DigiGoldBuyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DigiGoldBuyRecord.fromSnapshot(s));

  static Future<DigiGoldBuyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DigiGoldBuyRecord.fromSnapshot(s));

  static DigiGoldBuyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DigiGoldBuyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DigiGoldBuyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DigiGoldBuyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DigiGoldBuyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DigiGoldBuyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDigiGoldBuyRecordData({
  String? razorpayPaymentId,
  String? status,
  DateTime? time,
  String? amount,
  String? gold,
  String? goldPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'razorpay_payment_id': razorpayPaymentId,
      'status': status,
      'time': time,
      'amount': amount,
      'gold': gold,
      'gold_price': goldPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class DigiGoldBuyRecordDocumentEquality implements Equality<DigiGoldBuyRecord> {
  const DigiGoldBuyRecordDocumentEquality();

  @override
  bool equals(DigiGoldBuyRecord? e1, DigiGoldBuyRecord? e2) {
    return e1?.razorpayPaymentId == e2?.razorpayPaymentId &&
        e1?.status == e2?.status &&
        e1?.time == e2?.time &&
        e1?.amount == e2?.amount &&
        e1?.gold == e2?.gold &&
        e1?.goldPrice == e2?.goldPrice;
  }

  @override
  int hash(DigiGoldBuyRecord? e) => const ListEquality().hash([
        e?.razorpayPaymentId,
        e?.status,
        e?.time,
        e?.amount,
        e?.gold,
        e?.goldPrice
      ]);

  @override
  bool isValidKey(Object? o) => o is DigiGoldBuyRecord;
}
