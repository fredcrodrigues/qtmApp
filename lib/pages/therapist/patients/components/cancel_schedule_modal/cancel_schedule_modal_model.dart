import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/therapist/patients/components/erro_refused_modal/erro_refused_modal_widget.dart';
import '/pages/therapist/patients/components/refused_modal/refused_modal_widget.dart';
import 'cancel_schedule_modal_widget.dart' show CancelScheduleModalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
