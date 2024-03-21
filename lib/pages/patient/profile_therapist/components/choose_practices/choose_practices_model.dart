import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_practices_widget.dart' show ChoosePracticesWidget;
import 'package:flutter/material.dart';

class ChoosePracticesModel extends FlutterFlowModel<ChoosePracticesWidget> {
  ///  Local state fields for this page.

  List<PracticeRecord> practices = [];
  void addToPractices(PracticeRecord item) => practices.add(item);
  void removeFromPractices(PracticeRecord item) => practices.remove(item);
  void removeAtIndexFromPractices(int index) => practices.removeAt(index);
  void insertAtIndexInPractices(int index, PracticeRecord item) =>
      practices.insert(index, item);
  void updatePracticesAtIndex(int index, Function(PracticeRecord) updateFn) =>
      practices[index] = updateFn(practices[index]);

  PracticeRecord? choosedPractice;

  bool loadPractices = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in choose_practices widget.
  List<PracticeRecord>? practicesOfTheraphist;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PatientsRecord? patient;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
