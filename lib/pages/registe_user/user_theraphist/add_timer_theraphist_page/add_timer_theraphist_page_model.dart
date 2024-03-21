import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_timer_theraphist_page_widget.dart'
    show AddTimerTheraphistPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddTimerTheraphistPageModel
    extends FlutterFlowModel<AddTimerTheraphistPageWidget> {
  ///  Local state fields for this page.

  bool flagRegister = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for activeMonday widget.
  bool? activeMondayValue;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  DateTime? datePicked5;
  DateTime? datePicked6;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for activeTuesday widget.
  bool? activeTuesdayValue;
  DateTime? datePicked7;
  DateTime? datePicked8;
  DateTime? datePicked9;
  DateTime? datePicked10;
  DateTime? datePicked11;
  DateTime? datePicked12;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for activeWendnesDay widget.
  bool? activeWendnesDayValue;
  DateTime? datePicked13;
  DateTime? datePicked14;
  DateTime? datePicked15;
  DateTime? datePicked16;
  DateTime? datePicked17;
  DateTime? datePicked18;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController4;

  // State field(s) for activeThursday widget.
  bool? activeThursdayValue;
  DateTime? datePicked19;
  DateTime? datePicked20;
  DateTime? datePicked21;
  DateTime? datePicked22;
  DateTime? datePicked23;
  DateTime? datePicked24;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController5;

  // State field(s) for activeFriday widget.
  bool? activeFridayValue;
  DateTime? datePicked25;
  DateTime? datePicked26;
  DateTime? datePicked27;
  DateTime? datePicked28;
  DateTime? datePicked29;
  DateTime? datePicked30;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController6;

  // State field(s) for activeSaturday widget.
  bool? activeSaturdayValue;
  DateTime? datePicked31;
  DateTime? datePicked32;
  DateTime? datePicked33;
  DateTime? datePicked34;
  DateTime? datePicked35;
  DateTime? datePicked36;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController7;

  // State field(s) for activeSunday widget.
  bool? activeSundayValue;
  DateTime? datePicked37;
  DateTime? datePicked38;
  DateTime? datePicked39;
  DateTime? datePicked40;
  DateTime? datePicked41;
  DateTime? datePicked42;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: 'R\$ ###,##');
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  HoraryRecord? horaryCollection;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
    expandableController4.dispose();
    expandableController5.dispose();
    expandableController6.dispose();
    expandableController7.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
