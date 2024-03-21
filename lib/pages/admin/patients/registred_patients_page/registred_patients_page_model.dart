import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'registred_patients_page_widget.dart' show RegistredPatientsPageWidget;
import 'package:flutter/material.dart';

class RegistredPatientsPageModel
    extends FlutterFlowModel<RegistredPatientsPageWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> listPatients = [];
  void addToListPatients(UsersRecord item) => listPatients.add(item);
  void removeFromListPatients(UsersRecord item) => listPatients.remove(item);
  void removeAtIndexFromListPatients(int index) => listPatients.removeAt(index);
  void insertAtIndexInListPatients(int index, UsersRecord item) =>
      listPatients.insert(index, item);
  void updateListPatientsAtIndex(int index, Function(UsersRecord) updateFn) =>
      listPatients[index] = updateFn(listPatients[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in registred_patients_page widget.
  List<UsersRecord>? collectionPatient;

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
