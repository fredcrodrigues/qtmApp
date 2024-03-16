import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/drawer/components_general/bottom_navigation_bar_theraphist/bottom_navigation_bar_theraphist_widget.dart';
import '/pages/drawer/modal_languge/modal_languge_widget.dart';
import '/pages/therapist/introduction/turorial_theraphist_06_page/turorial_theraphist06_page_widget.dart';
import 'home_theraphist_page_widget.dart' show HomeTheraphistPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
