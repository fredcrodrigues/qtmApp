import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PrescriptionRecord extends FirestoreRecord {
  PrescriptionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "field" field.
  String? _field;
  String get field => _field ?? '';
  bool hasField() => _field != null;

  // "fk_patient" field.
  DocumentReference? _fkPatient;
  DocumentReference? get fkPatient => _fkPatient;
  bool hasFkPatient() => _fkPatient != null;

  // "fk_request" field.
  DocumentReference? _fkRequest;
  DocumentReference? get fkRequest => _fkRequest;
  bool hasFkRequest() => _fkRequest != null;

  // "fk_theraphist" field.
  DocumentReference? _fkTheraphist;
  DocumentReference? get fkTheraphist => _fkTheraphist;
  bool hasFkTheraphist() => _fkTheraphist != null;

  void _initializeFields() {
    _field = snapshotData['field'] as String?;
    _fkPatient = snapshotData['fk_patient'] as DocumentReference?;
    _fkRequest = snapshotData['fk_request'] as DocumentReference?;
    _fkTheraphist = snapshotData['fk_theraphist'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prescription');

  static Stream<PrescriptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrescriptionRecord.fromSnapshot(s));

  static Future<PrescriptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrescriptionRecord.fromSnapshot(s));

  static PrescriptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrescriptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrescriptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrescriptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrescriptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrescriptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrescriptionRecordData({
  String? field,
  DocumentReference? fkPatient,
  DocumentReference? fkRequest,
  DocumentReference? fkTheraphist,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'field': field,
      'fk_patient': fkPatient,
      'fk_request': fkRequest,
      'fk_theraphist': fkTheraphist,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrescriptionRecordDocumentEquality
    implements Equality<PrescriptionRecord> {
  const PrescriptionRecordDocumentEquality();

  @override
  bool equals(PrescriptionRecord? e1, PrescriptionRecord? e2) {
    return e1?.field == e2?.field &&
        e1?.fkPatient == e2?.fkPatient &&
        e1?.fkRequest == e2?.fkRequest &&
        e1?.fkTheraphist == e2?.fkTheraphist;
  }

  @override
  int hash(PrescriptionRecord? e) => const ListEquality()
      .hash([e?.field, e?.fkPatient, e?.fkRequest, e?.fkTheraphist]);

  @override
  bool isValidKey(Object? o) => o is PrescriptionRecord;
}
