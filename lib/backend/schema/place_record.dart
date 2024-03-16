import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceRecord extends FirestoreRecord {
  PlaceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "complement" field.
  String? _complement;
  String get complement => _complement ?? '';
  bool hasComplement() => _complement != null;

  // "fk_user" field.
  DocumentReference? _fkUser;
  DocumentReference? get fkUser => _fkUser;
  bool hasFkUser() => _fkUser != null;

  // "localization" field.
  LatLng? _localization;
  LatLng? get localization => _localization;
  bool hasLocalization() => _localization != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  void _initializeFields() {
    _adress = snapshotData['adress'] as String?;
    _complement = snapshotData['complement'] as String?;
    _fkUser = snapshotData['fk_user'] as DocumentReference?;
    _localization = snapshotData['localization'] as LatLng?;
    _state = snapshotData['state'] as String?;
    _city = snapshotData['city'] as String?;
    _country = snapshotData['country'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('place');

  static Stream<PlaceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaceRecord.fromSnapshot(s));

  static Future<PlaceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlaceRecord.fromSnapshot(s));

  static PlaceRecord fromSnapshot(DocumentSnapshot snapshot) => PlaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaceRecordData({
  String? adress,
  String? complement,
  DocumentReference? fkUser,
  LatLng? localization,
  String? state,
  String? city,
  String? country,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'adress': adress,
      'complement': complement,
      'fk_user': fkUser,
      'localization': localization,
      'state': state,
      'city': city,
      'country': country,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlaceRecordDocumentEquality implements Equality<PlaceRecord> {
  const PlaceRecordDocumentEquality();

  @override
  bool equals(PlaceRecord? e1, PlaceRecord? e2) {
    return e1?.adress == e2?.adress &&
        e1?.complement == e2?.complement &&
        e1?.fkUser == e2?.fkUser &&
        e1?.localization == e2?.localization &&
        e1?.state == e2?.state &&
        e1?.city == e2?.city &&
        e1?.country == e2?.country;
  }

  @override
  int hash(PlaceRecord? e) => const ListEquality().hash([
        e?.adress,
        e?.complement,
        e?.fkUser,
        e?.localization,
        e?.state,
        e?.city,
        e?.country
      ]);

  @override
  bool isValidKey(Object? o) => o is PlaceRecord;
}
