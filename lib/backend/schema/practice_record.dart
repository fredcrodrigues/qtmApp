import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PracticeRecord extends FirestoreRecord {
  PracticeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "speciliaty" field.
  String? _speciliaty;
  String get speciliaty => _speciliaty ?? '';
  bool hasSpeciliaty() => _speciliaty != null;

  // "fk_user" field.
  DocumentReference? _fkUser;
  DocumentReference? get fkUser => _fkUser;
  bool hasFkUser() => _fkUser != null;

  // "fk_coworking" field.
  DocumentReference? _fkCoworking;
  DocumentReference? get fkCoworking => _fkCoworking;
  bool hasFkCoworking() => _fkCoworking != null;

  // "type_of_service" field.
  List<String>? _typeOfService;
  List<String> get typeOfService => _typeOfService ?? const [];
  bool hasTypeOfService() => _typeOfService != null;

  // "check" field.
  bool? _check;
  bool get check => _check ?? false;
  bool hasCheck() => _check != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _speciliaty = snapshotData['speciliaty'] as String?;
    _fkUser = snapshotData['fk_user'] as DocumentReference?;
    _fkCoworking = snapshotData['fk_coworking'] as DocumentReference?;
    _typeOfService = getDataList(snapshotData['type_of_service']);
    _check = snapshotData['check'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('practice');

  static Stream<PracticeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PracticeRecord.fromSnapshot(s));

  static Future<PracticeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PracticeRecord.fromSnapshot(s));

  static PracticeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PracticeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PracticeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PracticeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PracticeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PracticeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPracticeRecordData({
  String? name,
  String? speciliaty,
  DocumentReference? fkUser,
  DocumentReference? fkCoworking,
  bool? check,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'speciliaty': speciliaty,
      'fk_user': fkUser,
      'fk_coworking': fkCoworking,
      'check': check,
    }.withoutNulls,
  );

  return firestoreData;
}

class PracticeRecordDocumentEquality implements Equality<PracticeRecord> {
  const PracticeRecordDocumentEquality();

  @override
  bool equals(PracticeRecord? e1, PracticeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.speciliaty == e2?.speciliaty &&
        e1?.fkUser == e2?.fkUser &&
        e1?.fkCoworking == e2?.fkCoworking &&
        listEquality.equals(e1?.typeOfService, e2?.typeOfService) &&
        e1?.check == e2?.check;
  }

  @override
  int hash(PracticeRecord? e) => const ListEquality().hash([
        e?.name,
        e?.speciliaty,
        e?.fkUser,
        e?.fkCoworking,
        e?.typeOfService,
        e?.check
      ]);

  @override
  bool isValidKey(Object? o) => o is PracticeRecord;
}
