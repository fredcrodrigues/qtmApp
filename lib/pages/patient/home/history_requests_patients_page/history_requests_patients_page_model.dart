import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer/components_general/bottomnavigationbar_patient/bottomnavigationbar_patient_widget.dart';
import 'history_requests_patients_page_widget.dart'
    show HistoryRequestsPatientsPageWidget;
import 'package:flutter/material.dart';

class HistoryRequestsPatientsPageModel
    extends FlutterFlowModel<HistoryRequestsPatientsPageWidget> {
  ///  Local state fields for this page.

  String filter = 'all';

  List<RequestsRecord> allRequests = [];
  void addToAllRequests(RequestsRecord item) => allRequests.add(item);
  void removeFromAllRequests(RequestsRecord item) => allRequests.remove(item);
  void removeAtIndexFromAllRequests(int index) => allRequests.removeAt(index);
  void insertAtIndexInAllRequests(int index, RequestsRecord item) =>
      allRequests.insert(index, item);
  void updateAllRequestsAtIndex(int index, Function(RequestsRecord) updateFn) =>
      allRequests[index] = updateFn(allRequests[index]);

  List<RequestsRecord> requestsFiltered = [];
  void addToRequestsFiltered(RequestsRecord item) => requestsFiltered.add(item);
  void removeFromRequestsFiltered(RequestsRecord item) =>
      requestsFiltered.remove(item);
  void removeAtIndexFromRequestsFiltered(int index) =>
      requestsFiltered.removeAt(index);
  void insertAtIndexInRequestsFiltered(int index, RequestsRecord item) =>
      requestsFiltered.insert(index, item);
  void updateRequestsFilteredAtIndex(
          int index, Function(RequestsRecord) updateFn) =>
      requestsFiltered[index] = updateFn(requestsFiltered[index]);

  bool loadRequests = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in history_requests_patients_page widget.
  List<RequestsRecord>? requests;
  // Model for bottomnavigationbarPatient component.
  late BottomnavigationbarPatientModel bottomnavigationbarPatientModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    bottomnavigationbarPatientModel =
        createModel(context, () => BottomnavigationbarPatientModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bottomnavigationbarPatientModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
