import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PatientsRecord extends FirestoreRecord {
  PatientsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fk_user" field.
  DocumentReference? _fkUser;
  DocumentReference? get fkUser => _fkUser;
  bool hasFkUser() => _fkUser != null;

  // "fk_cards" field.
  DocumentReference? _fkCards;
  DocumentReference? get fkCards => _fkCards;
  bool hasFkCards() => _fkCards != null;

  void _initializeFields() {
    _fkUser = snapshotData['fk_user'] as DocumentReference?;
    _fkCards = snapshotData['fk_cards'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('patients');

  static Stream<PatientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PatientsRecord.fromSnapshot(s));

  static Future<PatientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PatientsRecord.fromSnapshot(s));

  static PatientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PatientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PatientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PatientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PatientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PatientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPatientsRecordData({
  DocumentReference? fkUser,
  DocumentReference? fkCards,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fk_user': fkUser,
      'fk_cards': fkCards,
    }.withoutNulls,
  );

  return firestoreData;
}

class PatientsRecordDocumentEquality implements Equality<PatientsRecord> {
  const PatientsRecordDocumentEquality();

  @override
  bool equals(PatientsRecord? e1, PatientsRecord? e2) {
    return e1?.fkUser == e2?.fkUser && e1?.fkCards == e2?.fkCards;
  }

  @override
  int hash(PatientsRecord? e) =>
      const ListEquality().hash([e?.fkUser, e?.fkCards]);

  @override
  bool isValidKey(Object? o) => o is PatientsRecord;
}
