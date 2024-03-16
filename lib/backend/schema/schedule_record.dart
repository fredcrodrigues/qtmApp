import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduleRecord extends FirestoreRecord {
  ScheduleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titleTask" field.
  String? _titleTask;
  String get titleTask => _titleTask ?? '';
  bool hasTitleTask() => _titleTask != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "timer" field.
  DateTime? _timer;
  DateTime? get timer => _timer;
  bool hasTimer() => _timer != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _titleTask = snapshotData['titleTask'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _timer = snapshotData['timer'] as DateTime?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('schedule');

  static Stream<ScheduleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScheduleRecord.fromSnapshot(s));

  static Future<ScheduleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScheduleRecord.fromSnapshot(s));

  static ScheduleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScheduleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScheduleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScheduleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScheduleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScheduleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScheduleRecordData({
  String? titleTask,
  DateTime? date,
  DateTime? timer,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titleTask': titleTask,
      'date': date,
      'timer': timer,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScheduleRecordDocumentEquality implements Equality<ScheduleRecord> {
  const ScheduleRecordDocumentEquality();

  @override
  bool equals(ScheduleRecord? e1, ScheduleRecord? e2) {
    return e1?.titleTask == e2?.titleTask &&
        e1?.date == e2?.date &&
        e1?.timer == e2?.timer &&
        e1?.description == e2?.description;
  }

  @override
  int hash(ScheduleRecord? e) => const ListEquality()
      .hash([e?.titleTask, e?.date, e?.timer, e?.description]);

  @override
  bool isValidKey(Object? o) => o is ScheduleRecord;
}
