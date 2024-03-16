import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/therapist/schedules/components/aceppt_modal_theraphist/aceppt_modal_theraphist_widget.dart';
import '/pages/therapist/schedules/components/erro_moda_refund_theraphist/erro_moda_refund_theraphist_widget.dart';
import '/pages/therapist/schedules/components/reject_modal_theraphist/reject_modal_theraphist_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'schedules_theraphist_page_widget.dart'
    show SchedulesTheraphistPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SchedulesTheraphistPageModel
    extends FlutterFlowModel<SchedulesTheraphistPageWidget> {
  ///  Local state fields for this page.

  List<RequestsRecord> requests = [];
  void addToRequests(RequestsRecord item) => requests.add(item);
  void removeFromRequests(RequestsRecord item) => requests.remove(item);
  void removeAtIndexFromRequests(int index) => requests.removeAt(index);
  void insertAtIndexInRequests(int index, RequestsRecord item) =>
      requests.insert(index, item);
  void updateRequestsAtIndex(int index, Function(RequestsRecord) updateFn) =>
      requests[index] = updateFn(requests[index]);

  PatientsRecord? patients;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in schedules_theraphist_page widget.
  List<RequestsRecord>? collectionRequests;
  // Stores action output result for [Firestore Query - Query a collection] action in schedules_theraphist_page widget.
  List<PatientsRecord>? patientsCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in schedules_theraphist_page widget.
  List<UsersRecord>? userCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in schedules_theraphist_page widget.
  List<PracticeRecord>? praticeCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in schedules_theraphist_page widget.
  List<TheraphistRecord>? theraphistCollection;
  // Stores action output result for [Custom Action - priceTheraphist] action in schedules_theraphist_page widget.
  double? actionPrice;
  // Stores action output result for [Backend Call - API (confirm payment intent)] action in Button widget.
  ApiCallResponse? responseAccept;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  PatientsRecord? collectionPatients;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? collectionUser;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  PracticeRecord? collectionPratice;

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
