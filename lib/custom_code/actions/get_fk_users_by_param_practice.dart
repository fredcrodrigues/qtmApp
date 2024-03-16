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

List<DocumentReference> getFkUsersByParamPractice(
    String param, List<PracticeRecord> practices) {
  //filter practices
  List<PracticeRecord> filteredPractices = practices
      .where(
          (practice) => practice.name.contains(param) || practice.name == param)
      .toList();

  // find the correct references
  List<DocumentReference<Object?>> references = filteredPractices
      .map((filteredPractice) => practices
          .where(
              (practice) => practice.speciliaty == filteredPractice.speciliaty)
          .map((practice) => practice.fkUser as DocumentReference<Object?>)
          .toList())
      .expand((e) => e)
      .toList();

  return references;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
