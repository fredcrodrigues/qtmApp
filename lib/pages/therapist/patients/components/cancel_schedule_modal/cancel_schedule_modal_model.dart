import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cancel_schedule_modal_widget.dart' show CancelScheduleModalWidget;
import 'package:flutter/material.dart';

class CancelScheduleModalModel
    extends FlutterFlowModel<CancelScheduleModalWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (cancel payment intent)] action in Button widget.
  ApiCallResponse? responseCanceled;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CalendarRecord? singleCalendar;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
