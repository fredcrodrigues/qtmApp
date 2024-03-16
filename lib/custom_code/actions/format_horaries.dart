// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

List<HoraryFormatStruct> formatHoraries(
    HoraryRecord horaryDoc, List<RequestsRecord> requests) {
  List<HoraryFormatStruct> horaries = [];

  Map<String, dynamic> timersConvert = horaryDoc.days.toMap();

  for (var keyTimers in timersConvert.keys) {
    var valueTimers = timersConvert[keyTimers];

    if (valueTimers.containsKey('activate') && valueTimers['activate']) {
      valueTimers.forEach((key, value) {
        if (key.contains('field')) {
          var newTimer = adjustNextDate(value);

          if (!requests.isEmpty) {
            if (!requests.any((request) =>
                request.timer == newTimer &&
                request.timer!.day == newTimer.day)) {
              horaries.add(HoraryFormatStruct(
                  day: valueTimers['name'], timer: newTimer));
            }
          } else {
            horaries.add(
                HoraryFormatStruct(day: valueTimers['name'], timer: newTimer));
          }
        }
      });
    }
  }

  return horaries;
}
