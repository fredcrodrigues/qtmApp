import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CertificateRecord extends FirestoreRecord {
  CertificateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name_certificate" field.
  String? _nameCertificate;
  String get nameCertificate => _nameCertificate ?? '';
  bool hasNameCertificate() => _nameCertificate != null;

  // "attach" field.
  String? _attach;
  String get attach => _attach ?? '';
  bool hasAttach() => _attach != null;

  // "fk_user" field.
  DocumentReference? _fkUser;
  DocumentReference? get fkUser => _fkUser;
  bool hasFkUser() => _fkUser != null;

  // "year_conclusion" field.
  String? _yearConclusion;
  String get yearConclusion => _yearConclusion ?? '';
  bool hasYearConclusion() => _yearConclusion != null;

  void _initializeFields() {
    _nameCertificate = snapshotData['name_certificate'] as String?;
    _attach = snapshotData['attach'] as String?;
    _fkUser = snapshotData['fk_user'] as DocumentReference?;
    _yearConclusion = snapshotData['year_conclusion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('certificate');

  static Stream<CertificateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CertificateRecord.fromSnapshot(s));

  static Future<CertificateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CertificateRecord.fromSnapshot(s));

  static CertificateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CertificateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CertificateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CertificateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CertificateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CertificateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCertificateRecordData({
  String? nameCertificate,
  String? attach,
  DocumentReference? fkUser,
  String? yearConclusion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name_certificate': nameCertificate,
      'attach': attach,
      'fk_user': fkUser,
      'year_conclusion': yearConclusion,
    }.withoutNulls,
  );

  return firestoreData;
}

class CertificateRecordDocumentEquality implements Equality<CertificateRecord> {
  const CertificateRecordDocumentEquality();

  @override
  bool equals(CertificateRecord? e1, CertificateRecord? e2) {
    return e1?.nameCertificate == e2?.nameCertificate &&
        e1?.attach == e2?.attach &&
        e1?.fkUser == e2?.fkUser &&
        e1?.yearConclusion == e2?.yearConclusion;
  }

  @override
  int hash(CertificateRecord? e) => const ListEquality()
      .hash([e?.nameCertificate, e?.attach, e?.fkUser, e?.yearConclusion]);

  @override
  bool isValidKey(Object? o) => o is CertificateRecord;
}
