import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_timers_widget.dart' show ChooseTimersWidget;
import 'package:flutter/material.dart';

class ChooseTimersModel extends FlutterFlowModel<ChooseTimersWidget> {
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

  DateTime? choosedHorary;

  bool loadHoraries = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
