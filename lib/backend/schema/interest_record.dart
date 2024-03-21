import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class InterestRecord extends FirestoreRecord {
  InterestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "paragraph_one" field.
  String? _paragraphOne;
  String get paragraphOne => _paragraphOne ?? '';
  bool hasParagraphOne() => _paragraphOne != null;

  // "paragraph_two" field.
  String? _paragraphTwo;
  String get paragraphTwo => _paragraphTwo ?? '';
  bool hasParagraphTwo() => _paragraphTwo != null;

  // "paragraph_three" field.
  String? _paragraphThree;
  String get paragraphThree => _paragraphThree ?? '';
  bool hasParagraphThree() => _paragraphThree != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _paragraphOne = snapshotData['paragraph_one'] as String?;
    _paragraphTwo = snapshotData['paragraph_two'] as String?;
    _paragraphThree = snapshotData['paragraph_three'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('interest');

  static Stream<InterestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InterestRecord.fromSnapshot(s));

  static Future<InterestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InterestRecord.fromSnapshot(s));

  static InterestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InterestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InterestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InterestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InterestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InterestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInterestRecordData({
  String? title,
  String? description,
  String? image,
  String? paragraphOne,
  String? paragraphTwo,
  String? paragraphThree,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'paragraph_one': paragraphOne,
      'paragraph_two': paragraphTwo,
      'paragraph_three': paragraphThree,
    }.withoutNulls,
  );

  return firestoreData;
}

class InterestRecordDocumentEquality implements Equality<InterestRecord> {
  const InterestRecordDocumentEquality();

  @override
  bool equals(InterestRecord? e1, InterestRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.paragraphOne == e2?.paragraphOne &&
        e1?.paragraphTwo == e2?.paragraphTwo &&
        e1?.paragraphThree == e2?.paragraphThree;
  }

  @override
  int hash(InterestRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.image,
        e?.paragraphOne,
        e?.paragraphTwo,
        e?.paragraphThree
      ]);

  @override
  bool isValidKey(Object? o) => o is InterestRecord;
}
