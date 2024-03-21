import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer/components_general/bottomnavigationbar_patient/bottomnavigationbar_patient_widget.dart';
import 'home_patient_page_widget.dart' show HomePatientPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePatientPageModel extends FlutterFlowModel<HomePatientPageWidget> {
  ///  Local state fields for this page.

  List<RequestsRecord> request = [];
  void addToRequest(RequestsRecord item) => request.add(item);
  void removeFromRequest(RequestsRecord item) => request.remove(item);
  void removeAtIndexFromRequest(int index) => request.removeAt(index);
  void insertAtIndexInRequest(int index, RequestsRecord item) =>
      request.insert(index, item);
  void updateRequestAtIndex(int index, Function(RequestsRecord) updateFn) =>
      request[index] = updateFn(request[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in home_patient_page widget.
  PatientsRecord? patient;
  // Stores action output result for [Firestore Query - Query a collection] action in home_patient_page widget.
  List<RequestsRecord>? allRequests;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for bottomnavigationbarPatient component.
  late BottomnavigationbarPatientModel bottomnavigationbarPatientModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    bottomnavigationbarPatientModel =
        createModel(context, () => BottomnavigationbarPatientModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bottomnavigationbarPatientModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
