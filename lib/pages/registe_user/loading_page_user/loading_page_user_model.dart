import '/flutter_flow/flutter_flow_util.dart';
import 'loading_page_user_widget.dart' show LoadingPageUserWidget;
import 'package:flutter/material.dart';

class LoadingPageUserModel extends FlutterFlowModel<LoadingPageUserWidget> {
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
