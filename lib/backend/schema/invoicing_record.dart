import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoicingRecord extends FirestoreRecord {
  InvoicingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "fk_request" field.
  DocumentReference? _fkRequest;
  DocumentReference? get fkRequest => _fkRequest;
  bool hasFkRequest() => _fkRequest != null;

  // "paymentId" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  bool hasPaymentId() => _paymentId != null;

  // "fk_theraphit" field.
  String? _fkTheraphit;
  String get fkTheraphit => _fkTheraphit ?? '';
  bool hasFkTheraphit() => _fkTheraphit != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "id_bank" field.
  String? _idBank;
  String get idBank => _idBank ?? '';
  bool hasIdBank() => _idBank != null;

  // "total_again" field.
  double? _totalAgain;
  double get totalAgain => _totalAgain ?? 0.0;
  bool hasTotalAgain() => _totalAgain != null;

  void _initializeFields() {
    _fkRequest = snapshotData['fk_request'] as DocumentReference?;
    _paymentId = snapshotData['paymentId'] as String?;
    _fkTheraphit = snapshotData['fk_theraphit'] as String?;
    _status = snapshotData['status'] as String?;
    _idBank = snapshotData['id_bank'] as String?;
    _totalAgain = castToType<double>(snapshotData['total_again']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('invoicing');

  static Stream<InvoicingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoicingRecord.fromSnapshot(s));

  static Future<InvoicingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoicingRecord.fromSnapshot(s));

  static InvoicingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoicingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoicingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoicingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoicingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoicingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoicingRecordData({
  DocumentReference? fkRequest,
  String? paymentId,
  String? fkTheraphit,
  String? status,
  String? idBank,
  double? totalAgain,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fk_request': fkRequest,
      'paymentId': paymentId,
      'fk_theraphit': fkTheraphit,
      'status': status,
      'id_bank': idBank,
      'total_again': totalAgain,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoicingRecordDocumentEquality implements Equality<InvoicingRecord> {
  const InvoicingRecordDocumentEquality();

  @override
  bool equals(InvoicingRecord? e1, InvoicingRecord? e2) {
    return e1?.fkRequest == e2?.fkRequest &&
        e1?.paymentId == e2?.paymentId &&
        e1?.fkTheraphit == e2?.fkTheraphit &&
        e1?.status == e2?.status &&
        e1?.idBank == e2?.idBank &&
        e1?.totalAgain == e2?.totalAgain;
  }

  @override
  int hash(InvoicingRecord? e) => const ListEquality().hash([
        e?.fkRequest,
        e?.paymentId,
        e?.fkTheraphit,
        e?.status,
        e?.idBank,
        e?.totalAgain
      ]);

  @override
  bool isValidKey(Object? o) => o is InvoicingRecord;
}
