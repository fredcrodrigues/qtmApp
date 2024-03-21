import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manager_request_history_widget.dart' show ManagerRequestHistoryWidget;
import 'package:flutter/material.dart';

class ManagerRequestHistoryModel
    extends FlutterFlowModel<ManagerRequestHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CoworkingRecord? coworking;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  PracticeRecord? practice;

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
