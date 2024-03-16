import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/admin/components/actions_users_modal/actions_users_modal_widget.dart';
import 'registred_theraphist_page_widget.dart'
    show RegistredTheraphistPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistredTheraphistPageModel
    extends FlutterFlowModel<RegistredTheraphistPageWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> listTheraphist = [];
  void addToListTheraphist(UsersRecord item) => listTheraphist.add(item);
  void removeFromListTheraphist(UsersRecord item) =>
      listTheraphist.remove(item);
  void removeAtIndexFromListTheraphist(int index) =>
      listTheraphist.removeAt(index);
  void insertAtIndexInListTheraphist(int index, UsersRecord item) =>
      listTheraphist.insert(index, item);
  void updateListTheraphistAtIndex(int index, Function(UsersRecord) updateFn) =>
      listTheraphist[index] = updateFn(listTheraphist[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in registred_theraphist_page widget.
  List<UsersRecord>? collectionListTheraphist;

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
