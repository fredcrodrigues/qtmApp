import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'requests_page_widget.dart' show RequestsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RequestsPageModel extends FlutterFlowModel<RequestsPageWidget> {
  ///  Local state fields for this page.

  bool filter = true;

  List<RequestsRecord> requests = [];
  void addToRequests(RequestsRecord item) => requests.add(item);
  void removeFromRequests(RequestsRecord item) => requests.remove(item);
  void removeAtIndexFromRequests(int index) => requests.removeAt(index);
  void insertAtIndexInRequests(int index, RequestsRecord item) =>
      requests.insert(index, item);
  void updateRequestsAtIndex(int index, Function(RequestsRecord) updateFn) =>
      requests[index] = updateFn(requests[index]);

  List<RequestsRecord> backupRequests = [];
  void addToBackupRequests(RequestsRecord item) => backupRequests.add(item);
  void removeFromBackupRequests(RequestsRecord item) =>
      backupRequests.remove(item);
  void removeAtIndexFromBackupRequests(int index) =>
      backupRequests.removeAt(index);
  void insertAtIndexInBackupRequests(int index, RequestsRecord item) =>
      backupRequests.insert(index, item);
  void updateBackupRequestsAtIndex(
          int index, Function(RequestsRecord) updateFn) =>
      backupRequests[index] = updateFn(backupRequests[index]);

  bool loadRequests = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in requests_page widget.
  PatientsRecord? patient;
  // Stores action output result for [Firestore Query - Query a collection] action in requests_page widget.
  List<RequestsRecord>? requestsCollection;

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
