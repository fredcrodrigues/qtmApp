import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_filters_widget.dart' show ModalFiltersWidget;
import 'package:flutter/material.dart';

class ModalFiltersModel extends FlutterFlowModel<ModalFiltersWidget> {
  ///  Local state fields for this component.

  double? priceRangeLocal = 50.0;

  SpecialtyRecord? specialtyLocal;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in modal_filters widget.
  SpecialtyRecord? test;
  // State field(s) for Slider widget.
  double? sliderValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
