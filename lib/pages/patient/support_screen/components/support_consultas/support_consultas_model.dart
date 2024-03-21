import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'support_consultas_widget.dart' show SupportConsultasWidget;
import 'package:flutter/material.dart';

class SupportConsultasModel extends FlutterFlowModel<SupportConsultasWidget> {
  ///  Local state fields for this page.

  RequestsRecord? choosedRequest;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
