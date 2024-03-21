import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_coworkings_widget.dart' show ChooseCoworkingsWidget;
import 'package:flutter/material.dart';

class ChooseCoworkingsModel extends FlutterFlowModel<ChooseCoworkingsWidget> {
  ///  Local state fields for this page.

  CoworkingRecord? choosedCowoking;

  List<CoworkingRecord> listCoworkings = [];
  void addToListCoworkings(CoworkingRecord item) => listCoworkings.add(item);
  void removeFromListCoworkings(CoworkingRecord item) =>
      listCoworkings.remove(item);
  void removeAtIndexFromListCoworkings(int index) =>
      listCoworkings.removeAt(index);
  void insertAtIndexInListCoworkings(int index, CoworkingRecord item) =>
      listCoworkings.insert(index, item);
  void updateListCoworkingsAtIndex(
          int index, Function(CoworkingRecord) updateFn) =>
      listCoworkings[index] = updateFn(listCoworkings[index]);

  bool loadCoworking = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in choose_coworkings widget.
  List<CoworkingRecord>? listOfCoworking;
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
