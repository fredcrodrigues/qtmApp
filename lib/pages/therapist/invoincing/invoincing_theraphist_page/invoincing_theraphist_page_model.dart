import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invoincing_theraphist_page_widget.dart'
    show InvoincingTheraphistPageWidget;
import 'package:flutter/material.dart';

class InvoincingTheraphistPageModel
    extends FlutterFlowModel<InvoincingTheraphistPageWidget> {
  ///  Local state fields for this page.

  double? sumInvoincing;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in invoincing_theraphist_page widget.
  List<RequestsRecord>? collectionrequestsinprogress;
  // Stores action output result for [Firestore Query - Query a collection] action in invoincing_theraphist_page widget.
  List<RequestsRecord>? collectionrequestsfinalized;
  // Stores action output result for [Firestore Query - Query a collection] action in invoincing_theraphist_page widget.
  List<InvoicingRecord>? collectionInvoincig;

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
