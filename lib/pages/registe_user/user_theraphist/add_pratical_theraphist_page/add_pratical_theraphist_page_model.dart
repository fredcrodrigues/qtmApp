import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/registe_user/components/coworkig_create_regiter_modal/coworkig_create_regiter_modal_widget.dart';
import '/pages/registe_user/user_theraphist/introduction/turorial_theraphist_01_page/turorial_theraphist01_page_widget.dart';
import 'add_pratical_theraphist_page_widget.dart'
    show AddPraticalTheraphistPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AddPraticalTheraphistPageModel
    extends FlutterFlowModel<AddPraticalTheraphistPageWidget> {
  ///  Local state fields for this page.

  List<CoworkingRecord> listPratical = [];
  void addToListPratical(CoworkingRecord item) => listPratical.add(item);
  void removeFromListPratical(CoworkingRecord item) =>
      listPratical.remove(item);
  void removeAtIndexFromListPratical(int index) => listPratical.removeAt(index);
  void insertAtIndexInListPratical(int index, CoworkingRecord item) =>
      listPratical.insert(index, item);
  void updateListPraticalAtIndex(
          int index, Function(CoworkingRecord) updateFn) =>
      listPratical[index] = updateFn(listPratical[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for dropdownSelect widget.
  List<String>? dropdownSelectValue;
  FormFieldController<List<String>>? dropdownSelectValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  final textFieldMask3 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? textController3Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CertificateRecord? fkCertificateC;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PracticeRecord? fkPracticeC;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TheraphistRecord? singleTheraphistc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CertificateRecord? fkCertificate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PracticeRecord? fkPractice;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TheraphistRecord? singleTheraphist;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
