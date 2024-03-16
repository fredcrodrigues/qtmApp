import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'signup_register_user_page_widget.dart'
    show SignupRegisterUserPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupRegisterUserPageModel
    extends FlutterFlowModel<SignupRegisterUserPageWidget> {
  ///  Local state fields for this page.

  bool textField = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for userField widget.
  FocusNode? userFieldFocusNode;
  TextEditingController? userFieldController;
  String? Function(BuildContext, String?)? userFieldControllerValidator;
  String? _userFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uhwx3zjg' /* Campo username obrigatório */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  String? _emailFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tsg63cj4' /* Campo de email obrigatório */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for passwordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;
  String? _passwordFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wjqkh4l9' /* Campo de senha obrigatório */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        '0qv3inkx' /* A senha deve conter 8 caracter... */,
      );
    }

    if (!RegExp(
            '^(?=.*[a-zA-Z0-9!@#\$%^&*()-_+=])[a-zA-Z0-9!@#\$%^&*()-_+=]{1,8}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ck7mnzmg' /* A senha deve conter ao menos u... */,
      );
    }
    return null;
  }

  // State field(s) for repeatPasswordFieldOne widget.
  FocusNode? repeatPasswordFieldOneFocusNode;
  TextEditingController? repeatPasswordFieldOneController;
  late bool repeatPasswordFieldOneVisibility;
  String? Function(BuildContext, String?)?
      repeatPasswordFieldOneControllerValidator;
  String? _repeatPasswordFieldOneControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'idyhgr57' /* Campo de confirmar  senha obri... */,
      );
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    if (!RegExp('').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for repeatPasswordFieldTwo widget.
  FocusNode? repeatPasswordFieldTwoFocusNode;
  TextEditingController? repeatPasswordFieldTwoController;
  late bool repeatPasswordFieldTwoVisibility;
  String? Function(BuildContext, String?)?
      repeatPasswordFieldTwoControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userFieldControllerValidator = _userFieldControllerValidator;
    emailFieldControllerValidator = _emailFieldControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldControllerValidator = _passwordFieldControllerValidator;
    repeatPasswordFieldOneVisibility = false;
    repeatPasswordFieldOneControllerValidator =
        _repeatPasswordFieldOneControllerValidator;
    repeatPasswordFieldTwoVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userFieldFocusNode?.dispose();
    userFieldController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldController?.dispose();

    repeatPasswordFieldOneFocusNode?.dispose();
    repeatPasswordFieldOneController?.dispose();

    repeatPasswordFieldTwoFocusNode?.dispose();
    repeatPasswordFieldTwoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
