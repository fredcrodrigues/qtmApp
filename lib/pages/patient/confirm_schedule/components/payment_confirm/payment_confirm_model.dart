import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/patient/confirm_schedule/components/load_request/load_request_widget.dart';
import '/pages/patient/confirm_schedule/components/modal_success_request/modal_success_request_widget.dart';
import '/pages/patient/confirm_schedule/components/payment_method_not_choosed/payment_method_not_choosed_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'payment_confirm_widget.dart' show PaymentConfirmWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
