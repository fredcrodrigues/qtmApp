import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'register_theraphist_page_widget.dart' show RegisterTheraphistPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class RegisterTheraphistPageModel
    extends FlutterFlowModel<RegisterTheraphistPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> list = [];
  void addToList(dynamic item) => list.add(item);
  void removeFromList(dynamic item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, dynamic item) => list.insert(index, item);
  void updateListAtIndex(int index, Function(dynamic) updateFn) =>
      list[index] = updateFn(list[index]);

  List<dynamic> listcity = [];
  void addToListcity(dynamic item) => listcity.add(item);
  void removeFromListcity(dynamic item) => listcity.remove(item);
  void removeAtIndexFromListcity(int index) => listcity.removeAt(index);
  void insertAtIndexInListcity(int index, dynamic item) =>
      listcity.insert(index, item);
  void updateListcityAtIndex(int index, Function(dynamic) updateFn) =>
      listcity[index] = updateFn(listcity[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (localidades)] action in register_theraphist_page widget.
  ApiCallResponse? apiResultgwh;
  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfController;
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfControllerValidator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for complemnt widget.
  FocusNode? complemntFocusNode;
  TextEditingController? complemntController;
  String? Function(BuildContext, String?)? complemntControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    cpfFocusNode?.dispose();
    cpfController?.dispose();

    complemntFocusNode?.dispose();
    complemntController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
