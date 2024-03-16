import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/therapist/patients/components/erro_finalized_modal/erro_finalized_modal_widget.dart';
import '/pages/therapist/patients/components/information_modal/information_modal_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'prescription_modal_widget.dart' show PrescriptionModalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrescriptionModalModel extends FlutterFlowModel<PrescriptionModalWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SwitchPatient widget.
  bool? switchPatientValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for SwitchReturn widget.
  bool? switchReturnValue;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TheraphistRecord? theraphist;
  // Stores action output result for [Backend Call - API (transfer funds at the end of the appointment)] action in Button widget.
  ApiCallResponse? responseApiFinished;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PrescriptionRecord? collectionPrescription;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  RequestsRecord? singleRequest;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
