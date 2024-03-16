// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MondayStruct extends FFFirebaseStruct {
  MondayStruct({
    String? name,
    String? fieldOne,
    String? fieldTwo,
    String? fieldThree,
    String? fieldFour,
    String? fieldFive,
    String? fieldSix,
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
  String? _fieldOne;
  String get fieldOne => _fieldOne ?? '';
  set fieldOne(String? val) => _fieldOne = val;
  bool hasFieldOne() => _fieldOne != null;

  // "fieldTwo" field.
  String? _fieldTwo;
  String get fieldTwo => _fieldTwo ?? '';
  set fieldTwo(String? val) => _fieldTwo = val;
  bool hasFieldTwo() => _fieldTwo != null;

  // "fieldThree" field.
  String? _fieldThree;
  String get fieldThree => _fieldThree ?? '';
  set fieldThree(String? val) => _fieldThree = val;
  bool hasFieldThree() => _fieldThree != null;

  // "fieldFour" field.
  String? _fieldFour;
  String get fieldFour => _fieldFour ?? '';
  set fieldFour(String? val) => _fieldFour = val;
  bool hasFieldFour() => _fieldFour != null;

  // "fieldFive" field.
  String? _fieldFive;
  String get fieldFive => _fieldFive ?? '';
  set fieldFive(String? val) => _fieldFive = val;
  bool hasFieldFive() => _fieldFive != null;

  // "fieldSix" field.
  String? _fieldSix;
  String get fieldSix => _fieldSix ?? '';
  set fieldSix(String? val) => _fieldSix = val;
  bool hasFieldSix() => _fieldSix != null;

  // "activate" field.
  bool? _activate;
  bool get activate => _activate ?? false;
  set activate(bool? val) => _activate = val;
  bool hasActivate() => _activate != null;

  static MondayStruct fromMap(Map<String, dynamic> data) => MondayStruct(
        name: data['name'] as String?,
        fieldOne: data['fieldOne'] as String?,
        fieldTwo: data['fieldTwo'] as String?,
        fieldThree: data['fieldThree'] as String?,
        fieldFour: data['fieldFour'] as String?,
        fieldFive: data['fieldFive'] as String?,
        fieldSix: data['fieldSix'] as String?,
        activate: data['activate'] as bool?,
      );

  static MondayStruct? maybeFromMap(dynamic data) =>
      data is Map ? MondayStruct.fromMap(data.cast<String, dynamic>()) : null;

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
          ParamType.String,
        ),
        'fieldTwo': serializeParam(
          _fieldTwo,
          ParamType.String,
        ),
        'fieldThree': serializeParam(
          _fieldThree,
          ParamType.String,
        ),
        'fieldFour': serializeParam(
          _fieldFour,
          ParamType.String,
        ),
        'fieldFive': serializeParam(
          _fieldFive,
          ParamType.String,
        ),
        'fieldSix': serializeParam(
          _fieldSix,
          ParamType.String,
        ),
        'activate': serializeParam(
          _activate,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MondayStruct fromSerializableMap(Map<String, dynamic> data) =>
      MondayStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        fieldOne: deserializeParam(
          data['fieldOne'],
          ParamType.String,
          false,
        ),
        fieldTwo: deserializeParam(
          data['fieldTwo'],
          ParamType.String,
          false,
        ),
        fieldThree: deserializeParam(
          data['fieldThree'],
          ParamType.String,
          false,
        ),
        fieldFour: deserializeParam(
          data['fieldFour'],
          ParamType.String,
          false,
        ),
        fieldFive: deserializeParam(
          data['fieldFive'],
          ParamType.String,
          false,
        ),
        fieldSix: deserializeParam(
          data['fieldSix'],
          ParamType.String,
          false,
        ),
        activate: deserializeParam(
          data['activate'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MondayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MondayStruct &&
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

MondayStruct createMondayStruct({
  String? name,
  String? fieldOne,
  String? fieldTwo,
  String? fieldThree,
  String? fieldFour,
  String? fieldFive,
  String? fieldSix,
  bool? activate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MondayStruct(
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

MondayStruct? updateMondayStruct(
  MondayStruct? monday, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    monday
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMondayStructData(
  Map<String, dynamic> firestoreData,
  MondayStruct? monday,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (monday == null) {
    return;
  }
  if (monday.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && monday.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mondayData = getMondayFirestoreData(monday, forFieldValue);
  final nestedData = mondayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = monday.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMondayFirestoreData(
  MondayStruct? monday, [
  bool forFieldValue = false,
]) {
  if (monday == null) {
    return {};
  }
  final firestoreData = mapToFirestore(monday.toMap());

  // Add any Firestore field values
  monday.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMondayListFirestoreData(
  List<MondayStruct>? mondays,
) =>
    mondays?.map((e) => getMondayFirestoreData(e, true)).toList() ?? [];
