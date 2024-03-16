import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TypePlaceRecord extends FirestoreRecord {
  TypePlaceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('type_place');

  static Stream<TypePlaceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TypePlaceRecord.fromSnapshot(s));

  static Future<TypePlaceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TypePlaceRecord.fromSnapshot(s));

  static TypePlaceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TypePlaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TypePlaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TypePlaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TypePlaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TypePlaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTypePlaceRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class TypePlaceRecordDocumentEquality implements Equality<TypePlaceRecord> {
  const TypePlaceRecordDocumentEquality();

  @override
  bool equals(TypePlaceRecord? e1, TypePlaceRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(TypePlaceRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is TypePlaceRecord;
}
