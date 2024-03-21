import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TermsRecord extends FirestoreRecord {
  TermsRecord._(
    super.reference,
    super.data,
  ) {
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
      FirebaseFirestore.instance.collection('terms');

  static Stream<TermsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TermsRecord.fromSnapshot(s));

  static Future<TermsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TermsRecord.fromSnapshot(s));

  static TermsRecord fromSnapshot(DocumentSnapshot snapshot) => TermsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TermsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TermsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TermsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TermsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTermsRecordData({
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class TermsRecordDocumentEquality implements Equality<TermsRecord> {
  const TermsRecordDocumentEquality();

  @override
  bool equals(TermsRecord? e1, TermsRecord? e2) {
    return e1?.description == e2?.description;
  }

  @override
  int hash(TermsRecord? e) => const ListEquality().hash([e?.description]);

  @override
  bool isValidKey(Object? o) => o is TermsRecord;
}
