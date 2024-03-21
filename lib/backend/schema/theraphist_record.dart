import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TheraphistRecord extends FirestoreRecord {
  TheraphistRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "fk_user" field.
  DocumentReference? _fkUser;
  DocumentReference? get fkUser => _fkUser;
  bool hasFkUser() => _fkUser != null;

  // "fk_certificate" field.
  DocumentReference? _fkCertificate;
  DocumentReference? get fkCertificate => _fkCertificate;
  bool hasFkCertificate() => _fkCertificate != null;

  // "fk_horary" field.
  DocumentReference? _fkHorary;
  DocumentReference? get fkHorary => _fkHorary;
  bool hasFkHorary() => _fkHorary != null;

  // "fk_invoicing" field.
  DocumentReference? _fkInvoicing;
  DocumentReference? get fkInvoicing => _fkInvoicing;
  bool hasFkInvoicing() => _fkInvoicing != null;

  // "value_session" field.
  double? _valueSession;
  double get valueSession => _valueSession ?? 0.0;
  bool hasValueSession() => _valueSession != null;

  // "fk_speciality" field.
  DocumentReference? _fkSpeciality;
  DocumentReference? get fkSpeciality => _fkSpeciality;
  bool hasFkSpeciality() => _fkSpeciality != null;

  // "fk_practice" field.
  List<DocumentReference>? _fkPractice;
  List<DocumentReference> get fkPractice => _fkPractice ?? const [];
  bool hasFkPractice() => _fkPractice != null;

  // "fk_place" field.
  DocumentReference? _fkPlace;
  DocumentReference? get fkPlace => _fkPlace;
  bool hasFkPlace() => _fkPlace != null;

  // "accountConnectedId" field.
  String? _accountConnectedId;
  String get accountConnectedId => _accountConnectedId ?? '';
  bool hasAccountConnectedId() => _accountConnectedId != null;

  // "experience" field.
  String? _experience;
  String get experience => _experience ?? '';
  bool hasExperience() => _experience != null;

  // "whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  bool hasWhatsapp() => _whatsapp != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _fkUser = snapshotData['fk_user'] as DocumentReference?;
    _fkCertificate = snapshotData['fk_certificate'] as DocumentReference?;
    _fkHorary = snapshotData['fk_horary'] as DocumentReference?;
    _fkInvoicing = snapshotData['fk_invoicing'] as DocumentReference?;
    _valueSession = castToType<double>(snapshotData['value_session']);
    _fkSpeciality = snapshotData['fk_speciality'] as DocumentReference?;
    _fkPractice = getDataList(snapshotData['fk_practice']);
    _fkPlace = snapshotData['fk_place'] as DocumentReference?;
    _accountConnectedId = snapshotData['accountConnectedId'] as String?;
    _experience = snapshotData['experience'] as String?;
    _whatsapp = snapshotData['whatsapp'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('theraphist');

  static Stream<TheraphistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TheraphistRecord.fromSnapshot(s));

  static Future<TheraphistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TheraphistRecord.fromSnapshot(s));

  static TheraphistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TheraphistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TheraphistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TheraphistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TheraphistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TheraphistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTheraphistRecordData({
  DocumentReference? fkUser,
  DocumentReference? fkCertificate,
  DocumentReference? fkHorary,
  DocumentReference? fkInvoicing,
  double? valueSession,
  DocumentReference? fkSpeciality,
  DocumentReference? fkPlace,
  String? accountConnectedId,
  String? experience,
  String? whatsapp,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fk_user': fkUser,
      'fk_certificate': fkCertificate,
      'fk_horary': fkHorary,
      'fk_invoicing': fkInvoicing,
      'value_session': valueSession,
      'fk_speciality': fkSpeciality,
      'fk_place': fkPlace,
      'accountConnectedId': accountConnectedId,
      'experience': experience,
      'whatsapp': whatsapp,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class TheraphistRecordDocumentEquality implements Equality<TheraphistRecord> {
  const TheraphistRecordDocumentEquality();

  @override
  bool equals(TheraphistRecord? e1, TheraphistRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fkUser == e2?.fkUser &&
        e1?.fkCertificate == e2?.fkCertificate &&
        e1?.fkHorary == e2?.fkHorary &&
        e1?.fkInvoicing == e2?.fkInvoicing &&
        e1?.valueSession == e2?.valueSession &&
        e1?.fkSpeciality == e2?.fkSpeciality &&
        listEquality.equals(e1?.fkPractice, e2?.fkPractice) &&
        e1?.fkPlace == e2?.fkPlace &&
        e1?.accountConnectedId == e2?.accountConnectedId &&
        e1?.experience == e2?.experience &&
        e1?.whatsapp == e2?.whatsapp &&
        e1?.email == e2?.email;
  }

  @override
  int hash(TheraphistRecord? e) => const ListEquality().hash([
        e?.fkUser,
        e?.fkCertificate,
        e?.fkHorary,
        e?.fkInvoicing,
        e?.valueSession,
        e?.fkSpeciality,
        e?.fkPractice,
        e?.fkPlace,
        e?.accountConnectedId,
        e?.experience,
        e?.whatsapp,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is TheraphistRecord;
}
