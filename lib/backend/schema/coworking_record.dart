import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CoworkingRecord extends FirestoreRecord {
  CoworkingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "fk_user" field.
  DocumentReference? _fkUser;
  DocumentReference? get fkUser => _fkUser;
  bool hasFkUser() => _fkUser != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "ltd" field.
  LatLng? _ltd;
  LatLng? get ltd => _ltd;
  bool hasLtd() => _ltd != null;

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

  // "name_coworking" field.
  String? _nameCoworking;
  String get nameCoworking => _nameCoworking ?? '';
  bool hasNameCoworking() => _nameCoworking != null;

  // "fk_theraphist" field.
  DocumentReference? _fkTheraphist;
  DocumentReference? get fkTheraphist => _fkTheraphist;
  bool hasFkTheraphist() => _fkTheraphist != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "image" field.
  PlacesImageStruct? _image;
  PlacesImageStruct get image => _image ?? PlacesImageStruct();
  bool hasImage() => _image != null;

  void _initializeFields() {
    _fkUser = snapshotData['fk_user'] as DocumentReference?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _adress = snapshotData['adress'] as String?;
    _ltd = snapshotData['ltd'] as LatLng?;
    _state = snapshotData['state'] as String?;
    _city = snapshotData['city'] as String?;
    _country = snapshotData['country'] as String?;
    _nameCoworking = snapshotData['name_coworking'] as String?;
    _fkTheraphist = snapshotData['fk_theraphist'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _image = PlacesImageStruct.maybeFromMap(snapshotData['image']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coworking');

  static Stream<CoworkingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoworkingRecord.fromSnapshot(s));

  static Future<CoworkingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoworkingRecord.fromSnapshot(s));

  static CoworkingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoworkingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoworkingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoworkingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoworkingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoworkingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoworkingRecordData({
  DocumentReference? fkUser,
  DocumentReference? uid,
  String? description,
  String? adress,
  LatLng? ltd,
  String? state,
  String? city,
  String? country,
  String? nameCoworking,
  DocumentReference? fkTheraphist,
  String? type,
  PlacesImageStruct? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fk_user': fkUser,
      'uid': uid,
      'description': description,
      'adress': adress,
      'ltd': ltd,
      'state': state,
      'city': city,
      'country': country,
      'name_coworking': nameCoworking,
      'fk_theraphist': fkTheraphist,
      'type': type,
      'image': PlacesImageStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "image" field.
  addPlacesImageStructData(firestoreData, image, 'image');

  return firestoreData;
}

class CoworkingRecordDocumentEquality implements Equality<CoworkingRecord> {
  const CoworkingRecordDocumentEquality();

  @override
  bool equals(CoworkingRecord? e1, CoworkingRecord? e2) {
    return e1?.fkUser == e2?.fkUser &&
        e1?.uid == e2?.uid &&
        e1?.description == e2?.description &&
        e1?.adress == e2?.adress &&
        e1?.ltd == e2?.ltd &&
        e1?.state == e2?.state &&
        e1?.city == e2?.city &&
        e1?.country == e2?.country &&
        e1?.nameCoworking == e2?.nameCoworking &&
        e1?.fkTheraphist == e2?.fkTheraphist &&
        e1?.type == e2?.type &&
        e1?.image == e2?.image;
  }

  @override
  int hash(CoworkingRecord? e) => const ListEquality().hash([
        e?.fkUser,
        e?.uid,
        e?.description,
        e?.adress,
        e?.ltd,
        e?.state,
        e?.city,
        e?.country,
        e?.nameCoworking,
        e?.fkTheraphist,
        e?.type,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is CoworkingRecord;
}
