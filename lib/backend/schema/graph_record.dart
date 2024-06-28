import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GraphRecord extends FirestoreRecord {
  GraphRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "time" field.
  double? _time;
  double get time => _time ?? 0.0;
  bool hasTime() => _time != null;

  // "value" field.
  int? _value;
  int get value => _value ?? 0;
  bool hasValue() => _value != null;

  // "timeAsString" field.
  String? _timeAsString;
  String get timeAsString => _timeAsString ?? '';
  bool hasTimeAsString() => _timeAsString != null;

  void _initializeFields() {
    _time = castToType<double>(snapshotData['time']);
    _value = castToType<int>(snapshotData['value']);
    _timeAsString = snapshotData['timeAsString'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('graph');

  static Stream<GraphRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GraphRecord.fromSnapshot(s));

  static Future<GraphRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GraphRecord.fromSnapshot(s));

  static GraphRecord fromSnapshot(DocumentSnapshot snapshot) => GraphRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GraphRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GraphRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GraphRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GraphRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGraphRecordData({
  double? time,
  int? value,
  String? timeAsString,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time': time,
      'value': value,
      'timeAsString': timeAsString,
    }.withoutNulls,
  );

  return firestoreData;
}

class GraphRecordDocumentEquality implements Equality<GraphRecord> {
  const GraphRecordDocumentEquality();

  @override
  bool equals(GraphRecord? e1, GraphRecord? e2) {
    return e1?.time == e2?.time &&
        e1?.value == e2?.value &&
        e1?.timeAsString == e2?.timeAsString;
  }

  @override
  int hash(GraphRecord? e) =>
      const ListEquality().hash([e?.time, e?.value, e?.timeAsString]);

  @override
  bool isValidKey(Object? o) => o is GraphRecord;
}
