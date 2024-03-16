import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_widget.dart' show SearchWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
