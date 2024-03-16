// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DayStruct extends FFFirebaseStruct {
  DayStruct({
    String? name,
    DateTime? fieldOne,
    DateTime? fieldTwo,
    DateTime? fieldThree,
    DateTime? fieldFour,
    DateTime? fieldFive,
    DateTime? fieldSix,
    bool? activate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _fieldOne = fieldOne,
        _fieldTwo = fieldTwo,
        _fieldThree = fieldThree,
        _fieldFour = fieldFour,
        _fieldFive = fieldFive,
        _fieldSix = fieldSix,
        _activate = activate,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "fieldOne" field.
  DateTime? _fieldOne;
  DateTime? get fieldOne => _fieldOne;
  set fieldOne(DateTime? val) => _fieldOne = val;
  bool hasFieldOne() => _fieldOne != null;

  // "fieldTwo" field.
  DateTime? _fieldTwo;
  DateTime? get fieldTwo => _fieldTwo;
  set fieldTwo(DateTime? val) => _fieldTwo = val;
  bool hasFieldTwo() => _fieldTwo != null;

  // "fieldThree" field.
  DateTime? _fieldThree;
  DateTime? get fieldThree => _fieldThree;
  set fieldThree(DateTime? val) => _fieldThree = val;
  bool hasFieldThree() => _fieldThree != null;

  // "fieldFour" field.
  DateTime? _fieldFour;
  DateTime? get fieldFour => _fieldFour;
  set fieldFour(DateTime? val) => _fieldFour = val;
  bool hasFieldFour() => _fieldFour != null;

  // "fieldFive" field.
  DateTime? _fieldFive;
  DateTime? get fieldFive => _fieldFive;
  set fieldFive(DateTime? val) => _fieldFive = val;
  bool hasFieldFive() => _fieldFive != null;

  // "fieldSix" field.
  DateTime? _fieldSix;
  DateTime? get fieldSix => _fieldSix;
  set fieldSix(DateTime? val) => _fieldSix = val;
  bool hasFieldSix() => _fieldSix != null;

  // "activate" field.
  bool? _activate;
  bool get activate => _activate ?? false;
  set activate(bool? val) => _activate = val;
  bool hasActivate() => _activate != null;

  static DayStruct fromMap(Map<String, dynamic> data) => DayStruct(
        name: data['name'] as String?,
        fieldOne: data['fieldOne'] as DateTime?,
        fieldTwo: data['fieldTwo'] as DateTime?,
        fieldThree: data['fieldThree'] as DateTime?,
        fieldFour: data['fieldFour'] as DateTime?,
        fieldFive: data['fieldFive'] as DateTime?,
        fieldSix: data['fieldSix'] as DateTime?,
        activate: data['activate'] as bool?,
      );

  static DayStruct? maybeFromMap(dynamic data) =>
      data is Map ? DayStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'fieldOne': _fieldOne,
        'fieldTwo': _fieldTwo,
        'fieldThree': _fieldThree,
        'fieldFour': _fieldFour,
        'fieldFive': _fieldFive,
        'fieldSix': _fieldSix,
        'activate': _activate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'fieldOne': serializeParam(
          _fieldOne,
          ParamType.DateTime,
        ),
        'fieldTwo': serializeParam(
          _fieldTwo,
          ParamType.DateTime,
        ),
        'fieldThree': serializeParam(
          _fieldThree,
          ParamType.DateTime,
        ),
        'fieldFour': serializeParam(
          _fieldFour,
          ParamType.DateTime,
        ),
        'fieldFive': serializeParam(
          _fieldFive,
          ParamType.DateTime,
        ),
        'fieldSix': serializeParam(
          _fieldSix,
          ParamType.DateTime,
        ),
        'activate': serializeParam(
          _activate,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DayStruct fromSerializableMap(Map<String, dynamic> data) => DayStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        fieldOne: deserializeParam(
          data['fieldOne'],
          ParamType.DateTime,
          false,
        ),
        fieldTwo: deserializeParam(
          data['fieldTwo'],
          ParamType.DateTime,
          false,
        ),
        fieldThree: deserializeParam(
          data['fieldThree'],
          ParamType.DateTime,
          false,
        ),
        fieldFour: deserializeParam(
          data['fieldFour'],
          ParamType.DateTime,
          false,
        ),
        fieldFive: deserializeParam(
          data['fieldFive'],
          ParamType.DateTime,
          false,
        ),
        fieldSix: deserializeParam(
          data['fieldSix'],
          ParamType.DateTime,
          false,
        ),
        activate: deserializeParam(
          data['activate'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DayStruct &&
        name == other.name &&
        fieldOne == other.fieldOne &&
        fieldTwo == other.fieldTwo &&
        fieldThree == other.fieldThree &&
        fieldFour == other.fieldFour &&
        fieldFive == other.fieldFive &&
        fieldSix == other.fieldSix &&
        activate == other.activate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        fieldOne,
        fieldTwo,
        fieldThree,
        fieldFour,
        fieldFive,
        fieldSix,
        activate
      ]);
}

DayStruct createDayStruct({
  String? name,
  DateTime? fieldOne,
  DateTime? fieldTwo,
  DateTime? fieldThree,
  DateTime? fieldFour,
  DateTime? fieldFive,
  DateTime? fieldSix,
  bool? activate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DayStruct(
      name: name,
      fieldOne: fieldOne,
      fieldTwo: fieldTwo,
      fieldThree: fieldThree,
      fieldFour: fieldFour,
      fieldFive: fieldFive,
      fieldSix: fieldSix,
      activate: activate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DayStruct? updateDayStruct(
  DayStruct? day, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    day
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDayStructData(
  Map<String, dynamic> firestoreData,
  DayStruct? day,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (day == null) {
    return;
  }
  if (day.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && day.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dayData = getDayFirestoreData(day, forFieldValue);
  final nestedData = dayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = day.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDayFirestoreData(
  DayStruct? day, [
  bool forFieldValue = false,
]) {
  if (day == null) {
    return {};
  }
  final firestoreData = mapToFirestore(day.toMap());

  // Add any Firestore field values
  day.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDayListFirestoreData(
  List<DayStruct>? days,
) =>
    days?.map((e) => getDayFirestoreData(e, true)).toList() ?? [];
