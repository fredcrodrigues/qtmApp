import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirm_schedule_widget.dart' show ConfirmScheduleWidget;
import 'package:flutter/material.dart';

class ConfirmScheduleModel extends FlutterFlowModel<ConfirmScheduleWidget> {
  ///  Local state fields for this page.

  ProductsRecord? choosedCard;

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
