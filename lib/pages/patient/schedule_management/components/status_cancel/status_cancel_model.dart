import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'status_cancel_widget.dart' show StatusCancelWidget;
import 'package:flutter/material.dart';

class StatusCancelModel extends FlutterFlowModel<StatusCancelWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in statusCancel widget.
  TheraphistRecord? theraphist;
  // Stores action output result for [Backend Call - API (refund payment)] action in statusCancel widget.
  ApiCallResponse? refundResponse;

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
