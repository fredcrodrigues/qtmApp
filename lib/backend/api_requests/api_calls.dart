import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start StripeApiNode Group Code

class StripeApiNodeGroup {
  static String baseUrl = 'https://stripe-api-node.onrender.com';
  static Map<String, String> headers = {};
  static ValidateCardCall validateCardCall = ValidateCardCall();
  static CreatePaymentIntentCall createPaymentIntentCall =
      CreatePaymentIntentCall();
  static ConfirmPaymentIntentCall confirmPaymentIntentCall =
      ConfirmPaymentIntentCall();
  static CancelPaymentIntentCall cancelPaymentIntentCall =
      CancelPaymentIntentCall();
  static TransferFundsAtTheEndOfTheAppointmentCall
      transferFundsAtTheEndOfTheAppointmentCall =
      TransferFundsAtTheEndOfTheAppointmentCall();
  static RefundPaymentCall refundPaymentCall = RefundPaymentCall();
  static CreateAccountConnectedCall createAccountConnectedCall =
      CreateAccountConnectedCall();
  static CheckStatusPaymentIntentCall checkStatusPaymentIntentCall =
      CheckStatusPaymentIntentCall();
}

class ValidateCardCall {
  Future<ApiCallResponse> call({
    String? number = '',
    String? expYear = '',
    String? expMonth = '',
    String? cvc = '',
    String? jwt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "number": "$number",
  "exp_year": "$expYear",
  "exp_month": "$expMonth",
  "cvc": "$cvc",
  "jwt": "$jwt"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'validate card',
      apiUrl: '${StripeApiNodeGroup.baseUrl}/validate-card',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic brand(dynamic response) => getJsonField(
        response,
        r'''$.brand''',
      );
  dynamic funding(dynamic response) => getJsonField(
        response,
        r'''$.funding''',
      );
  dynamic validate(dynamic response) => getJsonField(
        response,
        r'''$.validate''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class CreatePaymentIntentCall {
  Future<ApiCallResponse> call({
    String? countryPayment = '',
    double? amount,
    String? email = '',
    String? numberCard = '',
    String? cvc = '',
    String? expMonth = '',
    String? expYear = '',
    String? jwt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "countryPayment": "$countryPayment",
  "amount": $amount,
  "email": "$email",
  "card": {
    "number": "$numberCard",
    "cvc": "$cvc",
    "exp_month": "$expMonth",
    "exp_year": "$expYear"
  },
  "jwt": "$jwt"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create payment intent',
      apiUrl: '${StripeApiNodeGroup.baseUrl}/create-payment-intent',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic paymentDetails(dynamic response) => getJsonField(
        response,
        r'''$.paymentDetails''',
      );
  dynamic paymentId(dynamic response) => getJsonField(
        response,
        r'''$.paymentDetails.paymentId''',
      );
}

class ConfirmPaymentIntentCall {
  Future<ApiCallResponse> call({
    String? paymentIntentId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'confirm payment intent',
      apiUrl: '${StripeApiNodeGroup.baseUrl}/confirm-payment-intent',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'paymentIntentId': paymentIntentId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelPaymentIntentCall {
  Future<ApiCallResponse> call({
    String? paymentIntentId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cancel payment intent',
      apiUrl: '${StripeApiNodeGroup.baseUrl}/cancel-payment-intent',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'paymentIntentId': paymentIntentId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class TransferFundsAtTheEndOfTheAppointmentCall {
  Future<ApiCallResponse> call({
    String? paymentIntentId = '',
    String? countryCode = '',
    String? connectedAccountSellerId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "paymentIntentId": "$paymentIntentId",
  "countryCode": "$countryCode",
  "connectedAccountSellerId": "$connectedAccountSellerId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'transfer funds at the end of the appointment',
      apiUrl: '${StripeApiNodeGroup.baseUrl}/transfer-funds',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class RefundPaymentCall {
  Future<ApiCallResponse> call({
    String? paymentIntentId = '',
    String? connectedAccountSellerId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "paymentIntentId": "$paymentIntentId",
  "connectedAccountSellerId": "$connectedAccountSellerId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'refund payment',
      apiUrl: '${StripeApiNodeGroup.baseUrl}/refund-payment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class CreateAccountConnectedCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? countryCode = '',
    String? name = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "countryCode": "$countryCode",
  "name": "$name"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create account connected',
      apiUrl: '${StripeApiNodeGroup.baseUrl}/create-account-connected',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  dynamic responseAccount(dynamic response) => getJsonField(
        response,
        r'''$.responseAccount''',
      );
  String? object(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.responseAccount.object''',
      ));
  int? created(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.responseAccount.created''',
      ));
  int? expiresAt(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.responseAccount.expires_at''',
      ));
  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.responseAccount.url''',
      ));
}

class CheckStatusPaymentIntentCall {
  Future<ApiCallResponse> call({
    String? paymentIntentId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'check status payment intent',
      apiUrl: '${StripeApiNodeGroup.baseUrl}/check-status-payment-intent',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'paymentIntentId': paymentIntentId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

/// End StripeApiNode Group Code

/// Start localidadesBr Group Code

class LocalidadesBrGroup {
  static String baseUrl = 'https://servicodados.ibge.gov.br';
  static Map<String, String> headers = {};
  static LocalidadesCall localidadesCall = LocalidadesCall();
  static CidadesCall cidadesCall = CidadesCall();
}

class LocalidadesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'localidades',
      apiUrl: '${LocalidadesBrGroup.baseUrl}/api/v1/localidades/estados',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? sigla(dynamic response) => getJsonField(
        response,
        r'''$[:].sigla''',
        true,
      ) as List?;
}

class CidadesCall {
  Future<ApiCallResponse> call({
    String? cidade = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cidades',
      apiUrl:
          '${LocalidadesBrGroup.baseUrl}/api/v1/localidades/estados/$cidade/distritos',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? cidade(dynamic response) => getJsonField(
        response,
        r'''$[:].nome''',
        true,
      ) as List?;
}

/// End localidadesBr Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
