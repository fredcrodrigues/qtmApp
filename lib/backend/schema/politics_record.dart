import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PoliticsRecord extends FirestoreRecord {
  PoliticsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('politics');

  static Stream<PoliticsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PoliticsRecord.fromSnapshot(s));

  static Future<PoliticsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PoliticsRecord.fromSnapshot(s));

  static PoliticsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PoliticsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PoliticsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PoliticsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PoliticsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PoliticsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPoliticsRecordData({
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class PoliticsRecordDocumentEquality implements Equality<PoliticsRecord> {
  const PoliticsRecordDocumentEquality();

  @override
  bool equals(PoliticsRecord? e1, PoliticsRecord? e2) {
    return e1?.description == e2?.description;
  }

  @override
  int hash(PoliticsRecord? e) => const ListEquality().hash([e?.description]);

  @override
  bool isValidKey(Object? o) => o is PoliticsRecord;
}
