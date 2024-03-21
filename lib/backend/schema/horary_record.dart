import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class HoraryRecord extends FirestoreRecord {
  HoraryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "fk_user" field.
  DocumentReference? _fkUser;
  DocumentReference? get fkUser => _fkUser;
  bool hasFkUser() => _fkUser != null;

  // "days" field.
  TimersStruct? _days;
  TimersStruct get days => _days ?? TimersStruct();
  bool hasDays() => _days != null;

  void _initializeFields() {
    _fkUser = snapshotData['fk_user'] as DocumentReference?;
    _days = TimersStruct.maybeFromMap(snapshotData['days']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('horary');

  static Stream<HoraryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HoraryRecord.fromSnapshot(s));

  static Future<HoraryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HoraryRecord.fromSnapshot(s));

  static HoraryRecord fromSnapshot(DocumentSnapshot snapshot) => HoraryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HoraryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HoraryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HoraryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HoraryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHoraryRecordData({
  DocumentReference? fkUser,
  TimersStruct? days,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fk_user': fkUser,
      'days': TimersStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "days" field.
  addTimersStructData(firestoreData, days, 'days');

  return firestoreData;
}

class HoraryRecordDocumentEquality implements Equality<HoraryRecord> {
  const HoraryRecordDocumentEquality();

  @override
  bool equals(HoraryRecord? e1, HoraryRecord? e2) {
    return e1?.fkUser == e2?.fkUser && e1?.days == e2?.days;
  }

  @override
  int hash(HoraryRecord? e) => const ListEquality().hash([e?.fkUser, e?.days]);

  @override
  bool isValidKey(Object? o) => o is HoraryRecord;
}
