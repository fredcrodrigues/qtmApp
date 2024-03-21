// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CardStruct extends FFFirebaseStruct {
  CardStruct({
    String? name,
    String? cardNumber,
    String? cvv,
    String? brand,
    String? funding,
    String? expMonth,
    String? expYear,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _cardNumber = cardNumber,
        _cvv = cvv,
        _brand = brand,
        _funding = funding,
        _expMonth = expMonth,
        _expYear = expYear,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "card_number" field.
  String? _cardNumber;
  String get cardNumber => _cardNumber ?? '';
  set cardNumber(String? val) => _cardNumber = val;
  bool hasCardNumber() => _cardNumber != null;

  // "cvv" field.
  String? _cvv;
  String get cvv => _cvv ?? '';
  set cvv(String? val) => _cvv = val;
  bool hasCvv() => _cvv != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  set brand(String? val) => _brand = val;
  bool hasBrand() => _brand != null;

  // "funding" field.
  String? _funding;
  String get funding => _funding ?? '';
  set funding(String? val) => _funding = val;
  bool hasFunding() => _funding != null;

  // "expMonth" field.
  String? _expMonth;
  String get expMonth => _expMonth ?? '';
  set expMonth(String? val) => _expMonth = val;
  bool hasExpMonth() => _expMonth != null;

  // "expYear" field.
  String? _expYear;
  String get expYear => _expYear ?? '';
  set expYear(String? val) => _expYear = val;
  bool hasExpYear() => _expYear != null;

  static CardStruct fromMap(Map<String, dynamic> data) => CardStruct(
        name: data['name'] as String?,
        cardNumber: data['card_number'] as String?,
        cvv: data['cvv'] as String?,
        brand: data['brand'] as String?,
        funding: data['funding'] as String?,
        expMonth: data['expMonth'] as String?,
        expYear: data['expYear'] as String?,
      );

  static CardStruct? maybeFromMap(dynamic data) =>
      data is Map ? CardStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'card_number': _cardNumber,
        'cvv': _cvv,
        'brand': _brand,
        'funding': _funding,
        'expMonth': _expMonth,
        'expYear': _expYear,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'card_number': serializeParam(
          _cardNumber,
          ParamType.String,
        ),
        'cvv': serializeParam(
          _cvv,
          ParamType.String,
        ),
        'brand': serializeParam(
          _brand,
          ParamType.String,
        ),
        'funding': serializeParam(
          _funding,
          ParamType.String,
        ),
        'expMonth': serializeParam(
          _expMonth,
          ParamType.String,
        ),
        'expYear': serializeParam(
          _expYear,
          ParamType.String,
        ),
      }.withoutNulls;

  static CardStruct fromSerializableMap(Map<String, dynamic> data) =>
      CardStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        cardNumber: deserializeParam(
          data['card_number'],
          ParamType.String,
          false,
        ),
        cvv: deserializeParam(
          data['cvv'],
          ParamType.String,
          false,
        ),
        brand: deserializeParam(
          data['brand'],
          ParamType.String,
          false,
        ),
        funding: deserializeParam(
          data['funding'],
          ParamType.String,
          false,
        ),
        expMonth: deserializeParam(
          data['expMonth'],
          ParamType.String,
          false,
        ),
        expYear: deserializeParam(
          data['expYear'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CardStruct &&
        name == other.name &&
        cardNumber == other.cardNumber &&
        cvv == other.cvv &&
        brand == other.brand &&
        funding == other.funding &&
        expMonth == other.expMonth &&
        expYear == other.expYear;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, cardNumber, cvv, brand, funding, expMonth, expYear]);
}

CardStruct createCardStruct({
  String? name,
  String? cardNumber,
  String? cvv,
  String? brand,
  String? funding,
  String? expMonth,
  String? expYear,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CardStruct(
      name: name,
      cardNumber: cardNumber,
      cvv: cvv,
      brand: brand,
      funding: funding,
      expMonth: expMonth,
      expYear: expYear,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CardStruct? updateCardStruct(
  CardStruct? card, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    card
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCardStructData(
  Map<String, dynamic> firestoreData,
  CardStruct? card,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (card == null) {
    return;
  }
  if (card.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && card.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cardData = getCardFirestoreData(card, forFieldValue);
  final nestedData = cardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = card.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCardFirestoreData(
  CardStruct? card, [
  bool forFieldValue = false,
]) {
  if (card == null) {
    return {};
  }
  final firestoreData = mapToFirestore(card.toMap());

  // Add any Firestore field values
  card.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCardListFirestoreData(
  List<CardStruct>? cards,
) =>
    cards?.map((e) => getCardFirestoreData(e, true)).toList() ?? [];
