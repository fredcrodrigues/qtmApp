import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/therapist/calendar/components/actions_event_modal/actions_event_modal_widget.dart';
import '/pages/therapist/calendar/components/event_modal/event_modal_widget.dart';
import 'calendar_theraphist_page_widget.dart' show CalendarTheraphistPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
