import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'schedulings_page_widget.dart' show SchedulingsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SchedulingsPageModel extends FlutterFlowModel<SchedulingsPageWidget> {
  ///  Local state fields for this page.

  List<RequestsRecord> resquetsCollection = [];
  void addToResquetsCollection(RequestsRecord item) =>
      resquetsCollection.add(item);
  void removeFromResquetsCollection(RequestsRecord item) =>
      resquetsCollection.remove(item);
  void removeAtIndexFromResquetsCollection(int index) =>
      resquetsCollection.removeAt(index);
  void insertAtIndexInResquetsCollection(int index, RequestsRecord item) =>
      resquetsCollection.insert(index, item);
  void updateResquetsCollectionAtIndex(
          int index, Function(RequestsRecord) updateFn) =>
      resquetsCollection[index] = updateFn(resquetsCollection[index]);

  PatientsRecord? patients;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in schedulings_page widget.
  List<RequestsRecord>? requestsCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in schedulings_page widget.
  List<PatientsRecord>? patientsCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in schedulings_page widget.
  List<UsersRecord>? usersCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in schedulings_page widget.
  List<PracticeRecord>? praticeCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in schedulings_page widget.
  List<TheraphistRecord>? theraphistCollection;
  // Stores action output result for [Custom Action - priceTheraphist] action in schedulings_page widget.
  double? actionPrice;

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
