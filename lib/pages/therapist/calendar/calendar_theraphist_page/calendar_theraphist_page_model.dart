import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calendar_theraphist_page_widget.dart' show CalendarTheraphistPageWidget;
import 'package:flutter/material.dart';

class CalendarTheraphistPageModel
    extends FlutterFlowModel<CalendarTheraphistPageWidget> {
  ///  Local state fields for this page.

  List<CalendarRecord> listCollectionCalendar = [];
  void addToListCollectionCalendar(CalendarRecord item) =>
      listCollectionCalendar.add(item);
  void removeFromListCollectionCalendar(CalendarRecord item) =>
      listCollectionCalendar.remove(item);
  void removeAtIndexFromListCollectionCalendar(int index) =>
      listCollectionCalendar.removeAt(index);
  void insertAtIndexInListCollectionCalendar(int index, CalendarRecord item) =>
      listCollectionCalendar.insert(index, item);
  void updateListCollectionCalendarAtIndex(
          int index, Function(CalendarRecord) updateFn) =>
      listCollectionCalendar[index] = updateFn(listCollectionCalendar[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in calendar_theraphist_page widget.
  List<CalendarRecord>? collectionCalendar;
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
