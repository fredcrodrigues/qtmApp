import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'schedulings_page_widget.dart' show SchedulingsPageWidget;
import 'package:flutter/material.dart';

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
