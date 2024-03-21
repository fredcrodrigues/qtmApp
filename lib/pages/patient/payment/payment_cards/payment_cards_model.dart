import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_cards_widget.dart' show PaymentCardsWidget;
import 'package:flutter/material.dart';

class PaymentCardsModel extends FlutterFlowModel<PaymentCardsWidget> {
  ///  Local state fields for this page.

  bool isLoadCards = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in payment_cards widget.
  PatientsRecord? patient;
  // Stores action output result for [Backend Call - Read Document] action in payment_cards widget.
  CardsRecord? cardsOfPatient;

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
