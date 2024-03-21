import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_theraphist_page_widget.dart' show ProfileTheraphistPageWidget;
import 'package:flutter/material.dart';

class ProfileTheraphistPageModel
    extends FlutterFlowModel<ProfileTheraphistPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in profile_theraphist_page widget.
  UsersRecord? singleUser;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for texfieldName widget.
  FocusNode? texfieldNameFocusNode;
  TextEditingController? texfieldNameController;
  String? Function(BuildContext, String?)? texfieldNameControllerValidator;
  String? _texfieldNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'syf3r2er' /* Campo Obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for lastNameTextfield widget.
  FocusNode? lastNameTextfieldFocusNode;
  TextEditingController? lastNameTextfieldController;
  String? Function(BuildContext, String?)? lastNameTextfieldControllerValidator;
  String? _lastNameTextfieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vufh32kt' /* Campo Obrigatório */,
      );
    }

    return null;
  }

  // State field(s) for genderTextfield widget.
  String? genderTextfieldValue;
  FormFieldController<String>? genderTextfieldValueController;
  // State field(s) for descriptionTextfield widget.
  FocusNode? descriptionTextfieldFocusNode;
  TextEditingController? descriptionTextfieldController;
  String? Function(BuildContext, String?)?
      descriptionTextfieldControllerValidator;
  String? _descriptionTextfieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '85ivzk41' /* Campo Obirgatório */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TheraphistRecord? singleTeraphist;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    texfieldNameControllerValidator = _texfieldNameControllerValidator;
    lastNameTextfieldControllerValidator =
        _lastNameTextfieldControllerValidator;
    descriptionTextfieldControllerValidator =
        _descriptionTextfieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    texfieldNameFocusNode?.dispose();
    texfieldNameController?.dispose();

    lastNameTextfieldFocusNode?.dispose();
    lastNameTextfieldController?.dispose();

    descriptionTextfieldFocusNode?.dispose();
    descriptionTextfieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
