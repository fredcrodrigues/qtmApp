import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'card_request_widget.dart' show CardRequestWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardRequestModel extends FlutterFlowModel<CardRequestWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in card_request widget.
  TheraphistRecord? theraphist;
  // Stores action output result for [Backend Call - Read Document] action in card_request widget.
  UsersRecord? user;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}