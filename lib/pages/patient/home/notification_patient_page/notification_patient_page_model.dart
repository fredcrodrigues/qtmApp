import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/drawer/components_general/bottomnavigationbar_patient/bottomnavigationbar_patient_widget.dart';
import '/pages/drawer/modal_languge/modal_languge_widget.dart';
import 'notification_patient_page_widget.dart'
    show NotificationPatientPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
