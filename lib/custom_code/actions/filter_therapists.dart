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

Future<List<TheraphistRecord>> filterTherapists(
    List<TheraphistRecord> therapists,
    String? searchParam,
    List<DocumentReference> referencesUsers) async {
  List<TheraphistRecord> filterDocs = [];

  for (final docData in therapists) {
    final DocumentReference referenceFkUser =
        docData.fkUser as DocumentReference;

    // get reference doc fk user
    final dynamic referenceDocFkUser = await referenceFkUser.get();

    //search by username
    if (referenceDocFkUser.exists) {
      // Acessando os dados do documento referenciado
      var referenceDocData = referenceDocFkUser.data()!;

      if (referenceDocData.containsKey('first_name') &&
          referenceDocData['first_name']
              .toString()
              .toLowerCase()
              .contains(searchParam!.toLowerCase())) {
        if (!filterDocs.contains(docData)) {
          filterDocs.add(docData);
        }
      }
    }

    //testando...
    if (referencesUsers.length != 0) {
      referencesUsers.forEach((reference) {
        var fkUser = docData.fkUser as DocumentReference<Object?>;
        if (fkUser == reference) {
          if (!filterDocs.contains(docData)) {
            filterDocs.add(docData);
          }
        }
      });
    }
    //testando....
  }

  return filterDocs;
}
