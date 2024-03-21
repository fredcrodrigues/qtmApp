// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimersStruct extends FFFirebaseStruct {
  TimersStruct({
    DayStruct? timeMonday,
    DayStruct? timeTuesday,
    DayStruct? timeWednesday,
    DayStruct? timeThursday,
    DayStruct? timeSaturday,
    DayStruct? timeSunday,
    DayStruct? timeFriday,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _timeMonday = timeMonday,
        _timeTuesday = timeTuesday,
        _timeWednesday = timeWednesday,
        _timeThursday = timeThursday,
        _timeSaturday = timeSaturday,
        _timeSunday = timeSunday,
        _timeFriday = timeFriday,
        super(firestoreUtilData);

  // "timeMonday" field.
  DayStruct? _timeMonday;
  DayStruct get timeMonday => _timeMonday ?? DayStruct();
  set timeMonday(DayStruct? val) => _timeMonday = val;
  void updateTimeMonday(Function(DayStruct) updateFn) =>
      updateFn(_timeMonday ??= DayStruct());
  bool hasTimeMonday() => _timeMonday != null;

  // "timeTuesday" field.
  DayStruct? _timeTuesday;
  DayStruct get timeTuesday => _timeTuesday ?? DayStruct();
  set timeTuesday(DayStruct? val) => _timeTuesday = val;
  void updateTimeTuesday(Function(DayStruct) updateFn) =>
      updateFn(_timeTuesday ??= DayStruct());
  bool hasTimeTuesday() => _timeTuesday != null;

  // "timeWednesday" field.
  DayStruct? _timeWednesday;
  DayStruct get timeWednesday => _timeWednesday ?? DayStruct();
  set timeWednesday(DayStruct? val) => _timeWednesday = val;
  void updateTimeWednesday(Function(DayStruct) updateFn) =>
      updateFn(_timeWednesday ??= DayStruct());
  bool hasTimeWednesday() => _timeWednesday != null;

  // "timeThursday" field.
  DayStruct? _timeThursday;
  DayStruct get timeThursday => _timeThursday ?? DayStruct();
  set timeThursday(DayStruct? val) => _timeThursday = val;
  void updateTimeThursday(Function(DayStruct) updateFn) =>
      updateFn(_timeThursday ??= DayStruct());
  bool hasTimeThursday() => _timeThursday != null;

  // "timeSaturday" field.
  DayStruct? _timeSaturday;
  DayStruct get timeSaturday => _timeSaturday ?? DayStruct();
  set timeSaturday(DayStruct? val) => _timeSaturday = val;
  void updateTimeSaturday(Function(DayStruct) updateFn) =>
      updateFn(_timeSaturday ??= DayStruct());
  bool hasTimeSaturday() => _timeSaturday != null;

  // "timeSunday" field.
  DayStruct? _timeSunday;
  DayStruct get timeSunday => _timeSunday ?? DayStruct();
  set timeSunday(DayStruct? val) => _timeSunday = val;
  void updateTimeSunday(Function(DayStruct) updateFn) =>
      updateFn(_timeSunday ??= DayStruct());
  bool hasTimeSunday() => _timeSunday != null;

  // "timeFriday" field.
  DayStruct? _timeFriday;
  DayStruct get timeFriday => _timeFriday ?? DayStruct();
  set timeFriday(DayStruct? val) => _timeFriday = val;
  void updateTimeFriday(Function(DayStruct) updateFn) =>
      updateFn(_timeFriday ??= DayStruct());
  bool hasTimeFriday() => _timeFriday != null;

  static TimersStruct fromMap(Map<String, dynamic> data) => TimersStruct(
        timeMonday: DayStruct.maybeFromMap(data['timeMonday']),
        timeTuesday: DayStruct.maybeFromMap(data['timeTuesday']),
        timeWednesday: DayStruct.maybeFromMap(data['timeWednesday']),
        timeThursday: DayStruct.maybeFromMap(data['timeThursday']),
        timeSaturday: DayStruct.maybeFromMap(data['timeSaturday']),
        timeSunday: DayStruct.maybeFromMap(data['timeSunday']),
        timeFriday: DayStruct.maybeFromMap(data['timeFriday']),
      );

  static TimersStruct? maybeFromMap(dynamic data) =>
      data is Map ? TimersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'timeMonday': _timeMonday?.toMap(),
        'timeTuesday': _timeTuesday?.toMap(),
        'timeWednesday': _timeWednesday?.toMap(),
        'timeThursday': _timeThursday?.toMap(),
        'timeSaturday': _timeSaturday?.toMap(),
        'timeSunday': _timeSunday?.toMap(),
        'timeFriday': _timeFriday?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timeMonday': serializeParam(
          _timeMonday,
          ParamType.DataStruct,
        ),
        'timeTuesday': serializeParam(
          _timeTuesday,
          ParamType.DataStruct,
        ),
        'timeWednesday': serializeParam(
          _timeWednesday,
          ParamType.DataStruct,
        ),
        'timeThursday': serializeParam(
          _timeThursday,
          ParamType.DataStruct,
        ),
        'timeSaturday': serializeParam(
          _timeSaturday,
          ParamType.DataStruct,
        ),
        'timeSunday': serializeParam(
          _timeSunday,
          ParamType.DataStruct,
        ),
        'timeFriday': serializeParam(
          _timeFriday,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TimersStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimersStruct(
        timeMonday: deserializeStructParam(
          data['timeMonday'],
          ParamType.DataStruct,
          false,
          structBuilder: DayStruct.fromSerializableMap,
        ),
        timeTuesday: deserializeStructParam(
          data['timeTuesday'],
          ParamType.DataStruct,
          false,
          structBuilder: DayStruct.fromSerializableMap,
        ),
        timeWednesday: deserializeStructParam(
          data['timeWednesday'],
          ParamType.DataStruct,
          false,
          structBuilder: DayStruct.fromSerializableMap,
        ),
        timeThursday: deserializeStructParam(
          data['timeThursday'],
          ParamType.DataStruct,
          false,
          structBuilder: DayStruct.fromSerializableMap,
        ),
        timeSaturday: deserializeStructParam(
          data['timeSaturday'],
          ParamType.DataStruct,
          false,
          structBuilder: DayStruct.fromSerializableMap,
        ),
        timeSunday: deserializeStructParam(
          data['timeSunday'],
          ParamType.DataStruct,
          false,
          structBuilder: DayStruct.fromSerializableMap,
        ),
        timeFriday: deserializeStructParam(
          data['timeFriday'],
          ParamType.DataStruct,
          false,
          structBuilder: DayStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TimersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimersStruct &&
        timeMonday == other.timeMonday &&
        timeTuesday == other.timeTuesday &&
        timeWednesday == other.timeWednesday &&
        timeThursday == other.timeThursday &&
        timeSaturday == other.timeSaturday &&
        timeSunday == other.timeSunday &&
        timeFriday == other.timeFriday;
  }

  @override
  int get hashCode => const ListEquality().hash([
        timeMonday,
        timeTuesday,
        timeWednesday,
        timeThursday,
        timeSaturday,
        timeSunday,
        timeFriday
      ]);
}

TimersStruct createTimersStruct({
  DayStruct? timeMonday,
  DayStruct? timeTuesday,
  DayStruct? timeWednesday,
  DayStruct? timeThursday,
  DayStruct? timeSaturday,
  DayStruct? timeSunday,
  DayStruct? timeFriday,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimersStruct(
      timeMonday: timeMonday ?? (clearUnsetFields ? DayStruct() : null),
      timeTuesday: timeTuesday ?? (clearUnsetFields ? DayStruct() : null),
      timeWednesday: timeWednesday ?? (clearUnsetFields ? DayStruct() : null),
      timeThursday: timeThursday ?? (clearUnsetFields ? DayStruct() : null),
      timeSaturday: timeSaturday ?? (clearUnsetFields ? DayStruct() : null),
      timeSunday: timeSunday ?? (clearUnsetFields ? DayStruct() : null),
      timeFriday: timeFriday ?? (clearUnsetFields ? DayStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TimersStruct? updateTimersStruct(
  TimersStruct? timers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    timers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTimersStructData(
  Map<String, dynamic> firestoreData,
  TimersStruct? timers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (timers == null) {
    return;
  }
  if (timers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && timers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final timersData = getTimersFirestoreData(timers, forFieldValue);
  final nestedData = timersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = timers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTimersFirestoreData(
  TimersStruct? timers, [
  bool forFieldValue = false,
]) {
  if (timers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(timers.toMap());

  // Handle nested data for "timeMonday" field.
  addDayStructData(
    firestoreData,
    timers.hasTimeMonday() ? timers.timeMonday : null,
    'timeMonday',
    forFieldValue,
  );

  // Handle nested data for "timeTuesday" field.
  addDayStructData(
    firestoreData,
    timers.hasTimeTuesday() ? timers.timeTuesday : null,
    'timeTuesday',
    forFieldValue,
  );

  // Handle nested data for "timeWednesday" field.
  addDayStructData(
    firestoreData,
    timers.hasTimeWednesday() ? timers.timeWednesday : null,
    'timeWednesday',
    forFieldValue,
  );

  // Handle nested data for "timeThursday" field.
  addDayStructData(
    firestoreData,
    timers.hasTimeThursday() ? timers.timeThursday : null,
    'timeThursday',
    forFieldValue,
  );

  // Handle nested data for "timeSaturday" field.
  addDayStructData(
    firestoreData,
    timers.hasTimeSaturday() ? timers.timeSaturday : null,
    'timeSaturday',
    forFieldValue,
  );

  // Handle nested data for "timeSunday" field.
  addDayStructData(
    firestoreData,
    timers.hasTimeSunday() ? timers.timeSunday : null,
    'timeSunday',
    forFieldValue,
  );

  // Handle nested data for "timeFriday" field.
  addDayStructData(
    firestoreData,
    timers.hasTimeFriday() ? timers.timeFriday : null,
    'timeFriday',
    forFieldValue,
  );

  // Add any Firestore field values
  timers.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTimersListFirestoreData(
  List<TimersStruct>? timerss,
) =>
    timerss?.map((e) => getTimersFirestoreData(e, true)).toList() ?? [];
