import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_therapist_widget.dart' show ProfileTherapistWidget;
import 'package:flutter/material.dart';

class ProfileTherapistModel extends FlutterFlowModel<ProfileTherapistWidget> {
  ///  Local state fields for this page.

  List<HoraryFormatStruct> horaries = [];
  void addToHoraries(HoraryFormatStruct item) => horaries.add(item);
  void removeFromHoraries(HoraryFormatStruct item) => horaries.remove(item);
  void removeAtIndexFromHoraries(int index) => horaries.removeAt(index);
  void insertAtIndexInHoraries(int index, HoraryFormatStruct item) =>
      horaries.insert(index, item);
  void updateHorariesAtIndex(
          int index, Function(HoraryFormatStruct) updateFn) =>
      horaries[index] = updateFn(horaries[index]);

  bool loadingHoraries = true;

  bool loadingCowokrings = false;

  List<CoworkingRecord> listCorworking = [];
  void addToListCorworking(CoworkingRecord item) => listCorworking.add(item);
  void removeFromListCorworking(CoworkingRecord item) =>
      listCorworking.remove(item);
  void removeAtIndexFromListCorworking(int index) =>
      listCorworking.removeAt(index);
  void insertAtIndexInListCorworking(int index, CoworkingRecord item) =>
      listCorworking.insert(index, item);
  void updateListCorworkingAtIndex(
          int index, Function(CoworkingRecord) updateFn) =>
      listCorworking[index] = updateFn(listCorworking[index]);

  int requestsFinalized = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in profile_therapist widget.
  HoraryRecord? horaryDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in profile_therapist widget.
  List<RequestsRecord>? requestsOfTheraphist;
  // Stores action output result for [Firestore Query - Query a collection] action in profile_therapist widget.
  List<CoworkingRecord>? collectionCoworking;
  // Stores action output result for [Custom Action - formatHoraries] action in profile_therapist widget.
  List<HoraryFormatStruct>? horariesFormated;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

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
