import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "kyc_verified" field.
  bool? _kycVerified;
  bool get kycVerified => _kycVerified ?? false;
  bool hasKycVerified() => _kycVerified != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "address" field.
  List<String>? _address;
  List<String> get address => _address ?? const [];
  bool hasAddress() => _address != null;

  // "upi_ids" field.
  List<String>? _upiIds;
  List<String> get upiIds => _upiIds ?? const [];
  bool hasUpiIds() => _upiIds != null;

  // "amount_bought" field.
  double? _amountBought;
  double get amountBought => _amountBought ?? 0.0;
  bool hasAmountBought() => _amountBought != null;

  // "gold_bought" field.
  double? _goldBought;
  double get goldBought => _goldBought ?? 0.0;
  bool hasGoldBought() => _goldBought != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _dateOfBirth = snapshotData['date_of_birth'] as DateTime?;
    _kycVerified = snapshotData['kyc_verified'] as bool?;
    _gender = snapshotData['gender'] as String?;
    _address = getDataList(snapshotData['address']);
    _upiIds = getDataList(snapshotData['upi_ids']);
    _amountBought = castToType<double>(snapshotData['amount_bought']);
    _goldBought = castToType<double>(snapshotData['gold_bought']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? dateOfBirth,
  bool? kycVerified,
  String? gender,
  double? amountBought,
  double? goldBought,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'date_of_birth': dateOfBirth,
      'kyc_verified': kycVerified,
      'gender': gender,
      'amount_bought': amountBought,
      'gold_bought': goldBought,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.kycVerified == e2?.kycVerified &&
        e1?.gender == e2?.gender &&
        listEquality.equals(e1?.address, e2?.address) &&
        listEquality.equals(e1?.upiIds, e2?.upiIds) &&
        e1?.amountBought == e2?.amountBought &&
        e1?.goldBought == e2?.goldBought;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.dateOfBirth,
        e?.kycVerified,
        e?.gender,
        e?.address,
        e?.upiIds,
        e?.amountBought,
        e?.goldBought
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
