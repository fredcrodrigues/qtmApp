// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlacesImageStruct extends FFFirebaseStruct {
  PlacesImageStruct({
    String? path1,
    String? path2,
    String? path3,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _path1 = path1,
        _path2 = path2,
        _path3 = path3,
        super(firestoreUtilData);

  // "path1" field.
  String? _path1;
  String get path1 => _path1 ?? '';
  set path1(String? val) => _path1 = val;
  bool hasPath1() => _path1 != null;

  // "path2" field.
  String? _path2;
  String get path2 => _path2 ?? '';
  set path2(String? val) => _path2 = val;
  bool hasPath2() => _path2 != null;

  // "path3" field.
  String? _path3;
  String get path3 => _path3 ?? '';
  set path3(String? val) => _path3 = val;
  bool hasPath3() => _path3 != null;

  static PlacesImageStruct fromMap(Map<String, dynamic> data) =>
      PlacesImageStruct(
        path1: data['path1'] as String?,
        path2: data['path2'] as String?,
        path3: data['path3'] as String?,
      );

  static PlacesImageStruct? maybeFromMap(dynamic data) => data is Map
      ? PlacesImageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'path1': _path1,
        'path2': _path2,
        'path3': _path3,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'path1': serializeParam(
          _path1,
          ParamType.String,
        ),
        'path2': serializeParam(
          _path2,
          ParamType.String,
        ),
        'path3': serializeParam(
          _path3,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlacesImageStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlacesImageStruct(
        path1: deserializeParam(
          data['path1'],
          ParamType.String,
          false,
        ),
        path2: deserializeParam(
          data['path2'],
          ParamType.String,
          false,
        ),
        path3: deserializeParam(
          data['path3'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlacesImageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlacesImageStruct &&
        path1 == other.path1 &&
        path2 == other.path2 &&
        path3 == other.path3;
  }

  @override
  int get hashCode => const ListEquality().hash([path1, path2, path3]);
}

PlacesImageStruct createPlacesImageStruct({
  String? path1,
  String? path2,
  String? path3,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlacesImageStruct(
      path1: path1,
      path2: path2,
      path3: path3,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlacesImageStruct? updatePlacesImageStruct(
  PlacesImageStruct? placesImage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placesImage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlacesImageStructData(
  Map<String, dynamic> firestoreData,
  PlacesImageStruct? placesImage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placesImage == null) {
    return;
  }
  if (placesImage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placesImage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placesImageData =
      getPlacesImageFirestoreData(placesImage, forFieldValue);
  final nestedData =
      placesImageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placesImage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlacesImageFirestoreData(
  PlacesImageStruct? placesImage, [
  bool forFieldValue = false,
]) {
  if (placesImage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placesImage.toMap());

  // Add any Firestore field values
  placesImage.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlacesImageListFirestoreData(
  List<PlacesImageStruct>? placesImages,
) =>
    placesImages?.map((e) => getPlacesImageFirestoreData(e, true)).toList() ??
    [];
