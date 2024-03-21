import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'schedules_theraphist_page_widget.dart'
    show SchedulesTheraphistPageWidget;
import 'package:flutter/material.dart';

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
