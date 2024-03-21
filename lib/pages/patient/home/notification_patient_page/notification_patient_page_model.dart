import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer/components_general/bottomnavigationbar_patient/bottomnavigationbar_patient_widget.dart';
import 'notification_patient_page_widget.dart'
    show NotificationPatientPageWidget;
import 'package:flutter/material.dart';

class NotificationPatientPageModel
    extends FlutterFlowModel<NotificationPatientPageWidget> {
  ///  Local state fields for this page.

  List<RequestsRecord> request = [];
  void addToRequest(RequestsRecord item) => request.add(item);
  void removeFromRequest(RequestsRecord item) => request.remove(item);
  void removeAtIndexFromRequest(int index) => request.removeAt(index);
  void insertAtIndexInRequest(int index, RequestsRecord item) =>
      request.insert(index, item);
  void updateRequestAtIndex(int index, Function(RequestsRecord) updateFn) =>
      request[index] = updateFn(request[index]);

  bool loadnotifications = false;

  List<NotificationsRecord> listnotifications = [];
  void addToListnotifications(NotificationsRecord item) =>
      listnotifications.add(item);
  void removeFromListnotifications(NotificationsRecord item) =>
      listnotifications.remove(item);
  void removeAtIndexFromListnotifications(int index) =>
      listnotifications.removeAt(index);
  void insertAtIndexInListnotifications(int index, NotificationsRecord item) =>
      listnotifications.insert(index, item);
  void updateListnotificationsAtIndex(
          int index, Function(NotificationsRecord) updateFn) =>
      listnotifications[index] = updateFn(listnotifications[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in notification_patient_page widget.
  List<NotificationsRecord>? collectionNotifications;
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
