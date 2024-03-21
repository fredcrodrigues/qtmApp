import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class SpecialtyRecord extends FirestoreRecord {
  SpecialtyRecord._(
    super.reference,
    super.data,
  ) {
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
      FirebaseFirestore.instance.collection('specialty');

  static Stream<SpecialtyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpecialtyRecord.fromSnapshot(s));

  static Future<SpecialtyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpecialtyRecord.fromSnapshot(s));

  static SpecialtyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpecialtyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpecialtyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpecialtyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpecialtyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpecialtyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpecialtyRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpecialtyRecordDocumentEquality implements Equality<SpecialtyRecord> {
  const SpecialtyRecordDocumentEquality();

  @override
  bool equals(SpecialtyRecord? e1, SpecialtyRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(SpecialtyRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is SpecialtyRecord;
}
