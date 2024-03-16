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

Future<void> insertTableHistory(String newSearch) async {
  ItemStruct jsonItem = ItemStruct(id: 0, term: "");
  bool isValid = true;

  if (!newSearch.trim().isEmpty) {
    FFAppState().update(() {
      FFAppState().tableHistoryLastId += 1;

      jsonItem.id = FFAppState().tableHistoryLastId;
      jsonItem.term = newSearch;

      for (var item in FFAppState().tableHistory) {
        if (item.term.contains(newSearch)) {
          isValid = false;
        }
      }

      if (isValid) {
        FFAppState().tableHistory.add(jsonItem);
      }
    });
  }
}
