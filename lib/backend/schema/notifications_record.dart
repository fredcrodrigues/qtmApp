import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "name_of_notification" field.
  String? _nameOfNotification;
  String get nameOfNotification => _nameOfNotification ?? '';
  bool hasNameOfNotification() => _nameOfNotification != null;

  // "type_of_notitfication" field.
  String? _typeOfNotitfication;
  String get typeOfNotitfication => _typeOfNotitfication ?? '';
  bool hasTypeOfNotitfication() => _typeOfNotitfication != null;

  // "fk_request" field.
  DocumentReference? _fkRequest;
  DocumentReference? get fkRequest => _fkRequest;
  bool hasFkRequest() => _fkRequest != null;

  // "fk_user_send" field.
  DocumentReference? _fkUserSend;
  DocumentReference? get fkUserSend => _fkUserSend;
  bool hasFkUserSend() => _fkUserSend != null;

  // "timer" field.
  DateTime? _timer;
  DateTime? get timer => _timer;
  bool hasTimer() => _timer != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _nameOfNotification = snapshotData['name_of_notification'] as String?;
    _typeOfNotitfication = snapshotData['type_of_notitfication'] as String?;
    _fkRequest = snapshotData['fk_request'] as DocumentReference?;
    _fkUserSend = snapshotData['fk_user_send'] as DocumentReference?;
    _timer = snapshotData['timer'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? description,
  String? nameOfNotification,
  String? typeOfNotitfication,
  DocumentReference? fkRequest,
  DocumentReference? fkUserSend,
  DateTime? timer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'name_of_notification': nameOfNotification,
      'type_of_notitfication': typeOfNotitfication,
      'fk_request': fkRequest,
      'fk_user_send': fkUserSend,
      'timer': timer,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.nameOfNotification == e2?.nameOfNotification &&
        e1?.typeOfNotitfication == e2?.typeOfNotitfication &&
        e1?.fkRequest == e2?.fkRequest &&
        e1?.fkUserSend == e2?.fkUserSend &&
        e1?.timer == e2?.timer;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.description,
        e?.nameOfNotification,
        e?.typeOfNotitfication,
        e?.fkRequest,
        e?.fkUserSend,
        e?.timer
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
