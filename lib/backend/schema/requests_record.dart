import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestsRecord extends FirestoreRecord {
  RequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timer" field.
  DateTime? _timer;
  DateTime? get timer => _timer;
  bool hasTimer() => _timer != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "fk_theraphist" field.
  DocumentReference? _fkTheraphist;
  DocumentReference? get fkTheraphist => _fkTheraphist;
  bool hasFkTheraphist() => _fkTheraphist != null;

  // "fk_patients" field.
  DocumentReference? _fkPatients;
  DocumentReference? get fkPatients => _fkPatients;
  bool hasFkPatients() => _fkPatients != null;

  // "fk_practice" field.
  DocumentReference? _fkPractice;
  DocumentReference? get fkPractice => _fkPractice;
  bool hasFkPractice() => _fkPractice != null;

  // "date_of_request" field.
  DateTime? _dateOfRequest;
  DateTime? get dateOfRequest => _dateOfRequest;
  bool hasDateOfRequest() => _dateOfRequest != null;

  // "paymentId" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  bool hasPaymentId() => _paymentId != null;

  // "fk_coworking" field.
  DocumentReference? _fkCoworking;
  DocumentReference? get fkCoworking => _fkCoworking;
  bool hasFkCoworking() => _fkCoworking != null;

  // "value_session" field.
  double? _valueSession;
  double get valueSession => _valueSession ?? 0.0;
  bool hasValueSession() => _valueSession != null;

  void _initializeFields() {
    _timer = snapshotData['timer'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _fkTheraphist = snapshotData['fk_theraphist'] as DocumentReference?;
    _fkPatients = snapshotData['fk_patients'] as DocumentReference?;
    _fkPractice = snapshotData['fk_practice'] as DocumentReference?;
    _dateOfRequest = snapshotData['date_of_request'] as DateTime?;
    _paymentId = snapshotData['paymentId'] as String?;
    _fkCoworking = snapshotData['fk_coworking'] as DocumentReference?;
    _valueSession = castToType<double>(snapshotData['value_session']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requests');

  static Stream<RequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsRecord.fromSnapshot(s));

  static Future<RequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsRecord.fromSnapshot(s));

  static RequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsRecordData({
  DateTime? timer,
  String? status,
  DocumentReference? fkTheraphist,
  DocumentReference? fkPatients,
  DocumentReference? fkPractice,
  DateTime? dateOfRequest,
  String? paymentId,
  DocumentReference? fkCoworking,
  double? valueSession,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timer': timer,
      'status': status,
      'fk_theraphist': fkTheraphist,
      'fk_patients': fkPatients,
      'fk_practice': fkPractice,
      'date_of_request': dateOfRequest,
      'paymentId': paymentId,
      'fk_coworking': fkCoworking,
      'value_session': valueSession,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsRecordDocumentEquality implements Equality<RequestsRecord> {
  const RequestsRecordDocumentEquality();

  @override
  bool equals(RequestsRecord? e1, RequestsRecord? e2) {
    return e1?.timer == e2?.timer &&
        e1?.status == e2?.status &&
        e1?.fkTheraphist == e2?.fkTheraphist &&
        e1?.fkPatients == e2?.fkPatients &&
        e1?.fkPractice == e2?.fkPractice &&
        e1?.dateOfRequest == e2?.dateOfRequest &&
        e1?.paymentId == e2?.paymentId &&
        e1?.fkCoworking == e2?.fkCoworking &&
        e1?.valueSession == e2?.valueSession;
  }

  @override
  int hash(RequestsRecord? e) => const ListEquality().hash([
        e?.timer,
        e?.status,
        e?.fkTheraphist,
        e?.fkPatients,
        e?.fkPractice,
        e?.dateOfRequest,
        e?.paymentId,
        e?.fkCoworking,
        e?.valueSession
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestsRecord;
}
