import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer/components_general/bottom_navigation_bar_theraphist/bottom_navigation_bar_theraphist_widget.dart';
import 'notification_theraphist_page_widget.dart'
    show NotificationTheraphistPageWidget;
import 'package:flutter/material.dart';

class NotificationTheraphistPageModel
    extends FlutterFlowModel<NotificationTheraphistPageWidget> {
  ///  Local state fields for this page.

  bool? loadnotifications;

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
  // Stores action output result for [Firestore Query - Query a collection] action in notification_theraphist_page widget.
  List<NotificationsRecord>? collectionNotifications;
  // Model for bottomNavigationBarTheraphist component.
  late BottomNavigationBarTheraphistModel bottomNavigationBarTheraphistModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    bottomNavigationBarTheraphistModel =
        createModel(context, () => BottomNavigationBarTheraphistModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bottomNavigationBarTheraphistModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
