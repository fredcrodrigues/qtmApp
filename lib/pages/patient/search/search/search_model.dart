import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  List<TheraphistRecord> theraphistsListData = [];
  void addToTheraphistsListData(TheraphistRecord item) =>
      theraphistsListData.add(item);
  void removeFromTheraphistsListData(TheraphistRecord item) =>
      theraphistsListData.remove(item);
  void removeAtIndexFromTheraphistsListData(int index) =>
      theraphistsListData.removeAt(index);
  void insertAtIndexInTheraphistsListData(int index, TheraphistRecord item) =>
      theraphistsListData.insert(index, item);
  void updateTheraphistsListDataAtIndex(
          int index, Function(TheraphistRecord) updateFn) =>
      theraphistsListData[index] = updateFn(theraphistsListData[index]);

  double? priceRange = 50.0;

  bool activeModalFilters = true;

  PracticeRecord? practiceChoosed;

  List<TheraphistRecord> theraphistsListBackup = [];
  void addToTheraphistsListBackup(TheraphistRecord item) =>
      theraphistsListBackup.add(item);
  void removeFromTheraphistsListBackup(TheraphistRecord item) =>
      theraphistsListBackup.remove(item);
  void removeAtIndexFromTheraphistsListBackup(int index) =>
      theraphistsListBackup.removeAt(index);
  void insertAtIndexInTheraphistsListBackup(int index, TheraphistRecord item) =>
      theraphistsListBackup.insert(index, item);
  void updateTheraphistsListBackupAtIndex(
          int index, Function(TheraphistRecord) updateFn) =>
      theraphistsListBackup[index] = updateFn(theraphistsListBackup[index]);

  bool loadTheraphists = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in search widget.
  List<TheraphistRecord>? therapists;
  // Stores action output result for [Firestore Query - Query a collection] action in search widget.
  List<PracticeRecord>? practices;
  // Stores action output result for [Custom Action - getFkUsersByParamPractice] action in search widget.
  List<DocumentReference>? references;
  // Stores action output result for [Custom Action - filterTherapists] action in search widget.
  List<TheraphistRecord>? theraphistsList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  List<TheraphistRecord>? listOfTheraphists;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  List<PracticeRecord>? practice;
  // Stores action output result for [Custom Action - getFkUsersByParamPractice] action in TextField widget.
  List<DocumentReference>? referencesUser;
  // Stores action output result for [Custom Action - filterTherapists] action in TextField widget.
  List<TheraphistRecord>? filterTheraphists;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<PracticeRecord>? allPractices;
  // Stores action output result for [Custom Action - getFkUsersByParamPractice] action in Row widget.
  List<DocumentReference>? referencesUsers;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
