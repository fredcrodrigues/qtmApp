import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer/components_general/bottom_navigation_bar_theraphist/bottom_navigation_bar_theraphist_widget.dart';
import 'home_theraphist_page_widget.dart' show HomeTheraphistPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeTheraphistPageModel
    extends FlutterFlowModel<HomeTheraphistPageWidget> {
  ///  Local state fields for this page.

  List<InterestRecord> listinterests = [];
  void addToListinterests(InterestRecord item) => listinterests.add(item);
  void removeFromListinterests(InterestRecord item) =>
      listinterests.remove(item);
  void removeAtIndexFromListinterests(int index) =>
      listinterests.removeAt(index);
  void insertAtIndexInListinterests(int index, InterestRecord item) =>
      listinterests.insert(index, item);
  void updateListinterestsAtIndex(
          int index, Function(InterestRecord) updateFn) =>
      listinterests[index] = updateFn(listinterests[index]);

  bool? loadIntersts;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in home_theraphist_page widget.
  TheraphistRecord? sinleTheraphist;
  // Stores action output result for [Firestore Query - Query a collection] action in home_theraphist_page widget.
  List<InterestRecord>? collcetionInterest;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for bottomNavigationBarTheraphist component.
  late BottomNavigationBarTheraphistModel bottomNavigationBarTheraphistModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    bottomNavigationBarTheraphistModel =
        createModel(context, () => BottomNavigationBarTheraphistModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bottomNavigationBarTheraphistModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
