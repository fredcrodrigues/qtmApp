import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/admin/components/actions_users_modal/actions_users_modal_widget.dart';
import 'registred_patients_page_widget.dart' show RegistredPatientsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
