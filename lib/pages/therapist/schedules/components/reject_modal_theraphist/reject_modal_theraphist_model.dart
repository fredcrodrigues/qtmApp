import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/therapist/schedules/components/alert_reject_theraphist/alert_reject_theraphist_widget.dart';
import '/pages/therapist/schedules/components/erro_moda_refund_theraphist/erro_moda_refund_theraphist_widget.dart';
import 'reject_modal_theraphist_widget.dart' show RejectModalTheraphistWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RejectModalTheraphistModel
    extends FlutterFlowModel<RejectModalTheraphistWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (cancel payment intent)] action in Button widget.
  ApiCallResponse? responseApiRefund;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
