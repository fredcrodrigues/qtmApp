import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/drawer/components_general/bottom_navigation_bar_theraphist/bottom_navigation_bar_theraphist_widget.dart';
import '/pages/drawer/modal_languge/modal_languge_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'history_requests_theraphist_page_widget.dart'
    show HistoryRequestsTheraphistPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class HistoryRequestsTheraphistPageModel
    extends FlutterFlowModel<HistoryRequestsTheraphistPageWidget> {
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
  // Stores action output result for [Firestore Query - Query a collection] action in history_requests_theraphist_page widget.
  List<RequestsRecord>? requests;
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
