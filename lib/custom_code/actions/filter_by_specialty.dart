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

Future<List<TheraphistRecord>> filterBySpecialty(
    List<TheraphistRecord> theraphists, SpecialtyRecord specialty) async {
  List<TheraphistRecord> itemsList = [];

  for (var item in theraphists) {
    final DocumentReference reference = item.fkSpeciality as DocumentReference;
    final docRerefence = await reference.get();

    if (docRerefence.exists) {
      dynamic docData = docRerefence.data()!;

      if (docData.containsKey('name') &&
          docData['name']
              .toString()
              .toLowerCase()
              .contains(specialty.name.toLowerCase())) {
        itemsList.add(item);
      }
    }
  }

  return itemsList;
}
