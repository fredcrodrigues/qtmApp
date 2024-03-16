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

Future<double> priceTheraphist(
  DocumentReference refTheraphist,
  List<TheraphistRecord> listTheraphist,
) async {
  double price = 0;
  double discount = 0;
  for (final theraphist in listTheraphist) {
    if (theraphist.reference == refTheraphist) {
      discount = 0.20 * theraphist.valueSession;
      price = theraphist.valueSession - discount;
    }
  }
  return price;
  // Add your function code here!
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
