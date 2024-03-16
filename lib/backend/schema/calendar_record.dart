import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarRecord extends FirestoreRecord {
  CalendarRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "name_event" field.
  String? _nameEvent;
  String get nameEvent => _nameEvent ?? '';
  bool hasNameEvent() => _nameEvent != null;

  // "type_event" field.
  String? _typeEvent;
  String get typeEvent => _typeEvent ?? '';
  bool hasTypeEvent() => _typeEvent != null;

  // "fk_user" field.
  DocumentReference? _fkUser;
  DocumentReference? get fkUser => _fkUser;
  bool hasFkUser() => _fkUser != null;

  // "info_add" field.
  String? _infoAdd;
  String get infoAdd => _infoAdd ?? '';
  bool hasInfoAdd() => _infoAdd != null;

  // "initial_hour" field.
  DateTime? _initialHour;
  DateTime? get initialHour => _initialHour;
  bool hasInitialHour() => _initialHour != null;

  // "end_hour" field.
  DateTime? _endHour;
  DateTime? get endHour => _endHour;
  bool hasEndHour() => _endHour != null;

  // "fk_request" field.
  DocumentReference? _fkRequest;
  DocumentReference? get fkRequest => _fkRequest;
  bool hasFkRequest() => _fkRequest != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _nameEvent = snapshotData['name_event'] as String?;
    _typeEvent = snapshotData['type_event'] as String?;
    _fkUser = snapshotData['fk_user'] as DocumentReference?;
    _infoAdd = snapshotData['info_add'] as String?;
    _initialHour = snapshotData['initial_hour'] as DateTime?;
    _endHour = snapshotData['end_hour'] as DateTime?;
    _fkRequest = snapshotData['fk_request'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('calendar');

  static Stream<CalendarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CalendarRecord.fromSnapshot(s));

  static Future<CalendarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CalendarRecord.fromSnapshot(s));

  static CalendarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CalendarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CalendarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CalendarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CalendarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CalendarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCalendarRecordData({
  DateTime? date,
  String? nameEvent,
  String? typeEvent,
  DocumentReference? fkUser,
  String? infoAdd,
  DateTime? initialHour,
  DateTime? endHour,
  DocumentReference? fkRequest,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'name_event': nameEvent,
      'type_event': typeEvent,
      'fk_user': fkUser,
      'info_add': infoAdd,
      'initial_hour': initialHour,
      'end_hour': endHour,
      'fk_request': fkRequest,
    }.withoutNulls,
  );

  return firestoreData;
}

class CalendarRecordDocumentEquality implements Equality<CalendarRecord> {
  const CalendarRecordDocumentEquality();

  @override
  bool equals(CalendarRecord? e1, CalendarRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.nameEvent == e2?.nameEvent &&
        e1?.typeEvent == e2?.typeEvent &&
        e1?.fkUser == e2?.fkUser &&
        e1?.infoAdd == e2?.infoAdd &&
        e1?.initialHour == e2?.initialHour &&
        e1?.endHour == e2?.endHour &&
        e1?.fkRequest == e2?.fkRequest;
  }

  @override
  int hash(CalendarRecord? e) => const ListEquality().hash([
        e?.date,
        e?.nameEvent,
        e?.typeEvent,
        e?.fkUser,
        e?.infoAdd,
        e?.initialHour,
        e?.endHour,
        e?.fkRequest
      ]);

  @override
  bool isValidKey(Object? o) => o is CalendarRecord;
}
