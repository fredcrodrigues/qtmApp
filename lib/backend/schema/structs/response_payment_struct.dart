// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponsePaymentStruct extends FFFirebaseStruct {
  ResponsePaymentStruct({
    int? status,
    String? message,
    String? paymentId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _message = message,
        _paymentId = paymentId,
        super(firestoreUtilData);

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;
  void incrementStatus(int amount) => _status = status + amount;
  bool hasStatus() => _status != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;
  bool hasMessage() => _message != null;

  // "paymentId" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  set paymentId(String? val) => _paymentId = val;
  bool hasPaymentId() => _paymentId != null;

  static ResponsePaymentStruct fromMap(Map<String, dynamic> data) =>
      ResponsePaymentStruct(
        status: castToType<int>(data['status']),
        message: data['message'] as String?,
        paymentId: data['paymentId'] as String?,
      );

  static ResponsePaymentStruct? maybeFromMap(dynamic data) => data is Map
      ? ResponsePaymentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'message': _message,
        'paymentId': _paymentId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'paymentId': serializeParam(
          _paymentId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResponsePaymentStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponsePaymentStruct(
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        paymentId: deserializeParam(
          data['paymentId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResponsePaymentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResponsePaymentStruct &&
        status == other.status &&
        message == other.message &&
        paymentId == other.paymentId;
  }

  @override
  int get hashCode => const ListEquality().hash([status, message, paymentId]);
}

ResponsePaymentStruct createResponsePaymentStruct({
  int? status,
  String? message,
  String? paymentId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponsePaymentStruct(
      status: status,
      message: message,
      paymentId: paymentId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponsePaymentStruct? updateResponsePaymentStruct(
  ResponsePaymentStruct? responsePayment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    responsePayment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponsePaymentStructData(
  Map<String, dynamic> firestoreData,
  ResponsePaymentStruct? responsePayment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (responsePayment == null) {
    return;
  }
  if (responsePayment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && responsePayment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responsePaymentData =
      getResponsePaymentFirestoreData(responsePayment, forFieldValue);
  final nestedData =
      responsePaymentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = responsePayment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponsePaymentFirestoreData(
  ResponsePaymentStruct? responsePayment, [
  bool forFieldValue = false,
]) {
  if (responsePayment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(responsePayment.toMap());

  // Add any Firestore field values
  responsePayment.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponsePaymentListFirestoreData(
  List<ResponsePaymentStruct>? responsePayments,
) =>
    responsePayments
        ?.map((e) => getResponsePaymentFirestoreData(e, true))
        .toList() ??
    [];
