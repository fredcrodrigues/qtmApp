import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'type_user_page_widget.dart' show TypeUserPageWidget;
import 'package:flutter/material.dart';

class TypeUserPageModel extends FlutterFlowModel<TypeUserPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TheraphistRecord? theraphist;

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
