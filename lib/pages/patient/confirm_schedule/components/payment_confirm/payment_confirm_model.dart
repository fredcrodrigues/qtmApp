import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'payment_confirm_widget.dart' show PaymentConfirmWidget;
import 'package:flutter/material.dart';

class PaymentConfirmModel extends FlutterFlowModel<PaymentConfirmWidget> {
  ///  Local state fields for this page.

  CardStruct? choosedCard;
  void updateChoosedCardStruct(Function(CardStruct) updateFn) =>
      updateFn(choosedCard ??= CardStruct());

  List<CardStruct> allCards = [];
  void addToAllCards(CardStruct item) => allCards.add(item);
  void removeFromAllCards(CardStruct item) => allCards.remove(item);
  void removeAtIndexFromAllCards(int index) => allCards.removeAt(index);
  void insertAtIndexInAllCards(int index, CardStruct item) =>
      allCards.insert(index, item);
  void updateAllCardsAtIndex(int index, Function(CardStruct) updateFn) =>
      allCards[index] = updateFn(allCards[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in payment_confirm widget.
  PatientsRecord? patientOne;
  // Stores action output result for [Backend Call - Read Document] action in payment_confirm widget.
  CardsRecord? cards;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PatientsRecord? patient;
  // Stores action output result for [Backend Call - API (create payment intent)] action in Button widget.
  ApiCallResponse? responsePayment;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RequestsRecord? request;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationsRecord? notification;

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
