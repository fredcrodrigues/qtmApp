import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'prescription_modal_widget.dart' show PrescriptionModalWidget;
import 'package:flutter/material.dart';

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
