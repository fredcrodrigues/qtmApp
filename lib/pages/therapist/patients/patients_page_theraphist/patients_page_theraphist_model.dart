import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/therapist/patients/components/cancel_schedule_modal/cancel_schedule_modal_widget.dart';
import '/pages/therapist/patients/components/prescription_modal/prescription_modal_widget.dart';
import 'patients_page_theraphist_widget.dart' show PatientsPageTheraphistWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PatientsPageTheraphistModel
    extends FlutterFlowModel<PatientsPageTheraphistWidget> {
  ///  Local state fields for this page.

  List<RequestsRecord> resquestsPatients = [];
  void addToResquestsPatients(RequestsRecord item) =>
      resquestsPatients.add(item);
  void removeFromResquestsPatients(RequestsRecord item) =>
      resquestsPatients.remove(item);
  void removeAtIndexFromResquestsPatients(int index) =>
      resquestsPatients.removeAt(index);
  void insertAtIndexInResquestsPatients(int index, RequestsRecord item) =>
      resquestsPatients.insert(index, item);
  void updateResquestsPatientsAtIndex(
          int index, Function(RequestsRecord) updateFn) =>
      resquestsPatients[index] = updateFn(resquestsPatients[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in patients_page_theraphist widget.
  List<RequestsRecord>? requestCollectionAccept;
  // Stores action output result for [Firestore Query - Query a collection] action in patients_page_theraphist widget.
  List<PatientsRecord>? patientsColletion;
  // Stores action output result for [Firestore Query - Query a collection] action in patients_page_theraphist widget.
  List<UsersRecord>? userCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in patients_page_theraphist widget.
  List<PracticeRecord>? praticeCollection;

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
