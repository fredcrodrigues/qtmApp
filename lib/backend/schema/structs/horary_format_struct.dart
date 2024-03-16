// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HoraryFormatStruct extends FFFirebaseStruct {
  HoraryFormatStruct({
    String? day,
    DateTime? timer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _day = day,
        _timer = timer,
        super(firestoreUtilData);

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  set day(String? val) => _day = val;
  bool hasDay() => _day != null;

  // "timer" field.
  DateTime? _timer;
  DateTime? get timer => _timer;
  set timer(DateTime? val) => _timer = val;
  bool hasTimer() => _timer != null;

  static HoraryFormatStruct fromMap(Map<String, dynamic> data) =>
      HoraryFormatStruct(
        day: data['day'] as String?,
        timer: data['timer'] as DateTime?,
      );

  static HoraryFormatStruct? maybeFromMap(dynamic data) => data is Map
      ? HoraryFormatStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'day': _day,
        'timer': _timer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'day': serializeParam(
          _day,
          ParamType.String,
        ),
        'timer': serializeParam(
          _timer,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static HoraryFormatStruct fromSerializableMap(Map<String, dynamic> data) =>
      HoraryFormatStruct(
        day: deserializeParam(
          data['day'],
          ParamType.String,
          false,
        ),
        timer: deserializeParam(
          data['timer'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'HoraryFormatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HoraryFormatStruct &&
        day == other.day &&
        timer == other.timer;
  }

  @override
  int get hashCode => const ListEquality().hash([day, timer]);
}

HoraryFormatStruct createHoraryFormatStruct({
  String? day,
  DateTime? timer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HoraryFormatStruct(
      day: day,
      timer: timer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HoraryFormatStruct? updateHoraryFormatStruct(
  HoraryFormatStruct? horaryFormat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    horaryFormat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHoraryFormatStructData(
  Map<String, dynamic> firestoreData,
  HoraryFormatStruct? horaryFormat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (horaryFormat == null) {
    return;
  }
  if (horaryFormat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && horaryFormat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final horaryFormatData =
      getHoraryFormatFirestoreData(horaryFormat, forFieldValue);
  final nestedData =
      horaryFormatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = horaryFormat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHoraryFormatFirestoreData(
  HoraryFormatStruct? horaryFormat, [
  bool forFieldValue = false,
]) {
  if (horaryFormat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(horaryFormat.toMap());

  // Add any Firestore field values
  horaryFormat.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHoraryFormatListFirestoreData(
  List<HoraryFormatStruct>? horaryFormats,
) =>
    horaryFormats?.map((e) => getHoraryFormatFirestoreData(e, true)).toList() ??
    [];
