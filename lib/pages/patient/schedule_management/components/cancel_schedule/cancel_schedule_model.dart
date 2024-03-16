import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/patient/schedule_management/components/modal_failed/modal_failed_widget.dart';
import '/pages/patient/schedule_management/components/modal_more_info/modal_more_info_widget.dart';
import '/pages/patient/schedule_management/components/modal_success_cancel/modal_success_cancel_widget.dart';
import 'cancel_schedule_widget.dart' show CancelScheduleWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CancelScheduleModel extends FlutterFlowModel<CancelScheduleWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (check status payment intent)] action in Button widget.
  ApiCallResponse? response;
  // Stores action output result for [Backend Call - API (cancel payment intent)] action in Button widget.
  ApiCallResponse? responseCancelPayment;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
