import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<CardStruct> deleteCardFromUser(
  List<CardStruct> cards,
  CardStruct cardDeleted,
) {
  List<CardStruct> cardsUpdated = [];

  cards.forEach((card) {
    if (!(card.cardNumber == cardDeleted.cardNumber)) {
      cardsUpdated.add(card);
    }
  });

  return cardsUpdated;
}

DateTime adjustNextDate(DateTime previousDate) {
  DateTime dateNow = DateTime.now();
  DateTime newDate;

  if (dateNow.weekday == previousDate.weekday &&
      dateNow.hour < previousDate.hour) {
    newDate = DateTime(dateNow.year, dateNow.month, dateNow.day,
        previousDate.hour, previousDate.minute, previousDate.second);
  } else {
    int daysUntilNextOccurrence = previousDate.weekday - dateNow.weekday;
    if (daysUntilNextOccurrence <= 0) {
      daysUntilNextOccurrence +=
          7; //if negative, add 7 for the next occurrence in same week
    }
    DateTime nextOccurrence =
        dateNow.add(Duration(days: daysUntilNextOccurrence));

    newDate = DateTime(
      nextOccurrence.year,
      nextOccurrence.month,
      nextOccurrence.day,
      previousDate.hour,
      previousDate.minute,
      previousDate.second,
    );
  }

  return newDate;
}

List<TheraphistRecord> filterTheraphistsByPrice(
  List<TheraphistRecord> theraphists,
  double price,
) {
  List<TheraphistRecord> filteredTheraphists = [];

  for (var theraphist in theraphists) {
    if (theraphist.valueSession <= price) {
      filteredTheraphists.add(theraphist);
    }
  }

  return filteredTheraphists;
}

List<RequestsRecord> filterRequests(
  List<RequestsRecord> requestsCollection,
  bool accepted,
) {
  List<RequestsRecord> filteredRequests = [];
  String status = "";

  for (final request in requestsCollection) {
    status = request.status;

    if (accepted) {
      if (status != "in progress" &&
          status != "refused" &&
          status != "canceled" &&
          status != "finalized") {
        filteredRequests.add(request);
      }
    } else {
      if (status == "in progress") {
        filteredRequests.add(request);
      }
    }
  }

  return filteredRequests;
}

DateTime addMinutes(
  DateTime timer,
  int minutes,
) {
  return timer.add(Duration(minutes: minutes));
}

List<TheraphistRecord> filterTheraphistsByPractice(
  List<TheraphistRecord> theraphists,
  List<DocumentReference> referencesUsers,
) {
  List<TheraphistRecord> filterDocs = [];

  //testando...
  for (var docData in theraphists) {
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
  }
  //testando....

  return filterDocs;
}

CardStruct selectCardByName(
  String name,
  List<CardStruct> cards,
) {
  CardStruct choosedCard = CardStruct();

  for (var card in cards) {
    if (card.name == name) {
      choosedCard = card;
    }
  }

  return choosedCard;
}

List<DocumentReference> actionList(List<RequestsRecord> listRequests) {
  List<DocumentReference>? reference = [];

  for (var refPatient in listRequests) {
    reference.add(refPatient.reference);
  }
  return reference;
}

List<UsersRecord> listProfileUser(
  DocumentReference rePatients,
  List<PatientsRecord> listPatient,
  List<UsersRecord> listUser,
) {
  List<UsersRecord> newListUser = [];

  for (final patient in listPatient) {
    if (patient.reference == rePatients) {
      for (final user in listUser) {
        if (user.reference == patient.fkUser) {
          newListUser.add(user);
        }
      }
    }
  }

  return newListUser;
}

List<PracticeRecord> listPratice(
  DocumentReference refPratice,
  List<PracticeRecord> listPratics,
) {
  List<PracticeRecord> newListPractice = [];
  for (final pratice in listPratics) {
    if (pratice.reference == refPratice) {
      newListPractice.add(pratice);
    }
  }

  return newListPractice;
}

double? convertDouble(String valueSession) {
  var newValue = double.tryParse(valueSession);

  return newValue;
}

String segmentStringExpiration(
  String type,
  String expirationDate,
) {
  String str = "";
  List<String> strings = expirationDate.split("/");

  str = type == "year" ? strings[1] : strings[0];

  return str;
}

String convertNumberCurrency(double number) {
  double value = number / 100;
  var formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return formatter.format(value);
}

double convertValuePratice(String number) {
  return double.parse(number.replaceAll(RegExp(r'[R$.,]'), ''));
}

List<RequestsRecord> filterRequestsInHistory(
  List<RequestsRecord> allRequests,
  String filter,
) {
  List<RequestsRecord> filteredRequests = [];

  allRequests.forEach((request) {
    if (filter == "canceled") {
      if (request.status == "refused" || request.status == "canceled") {
        filteredRequests.add(request);
      }
    } else if (filter == "finalized") {
      if (request.status == "finalized") {
        filteredRequests.add(request);
      }
    } else {
      filteredRequests.add(request);
    }
  });

  return filteredRequests;
}

double calculatePercente(double number) {
  double percente = 0.2;
  double convertnumber = number / 100; // adiciona virgula 200,00
  double discount = convertnumber * percente;

  double result = convertnumber - discount;

  return result;
}

double sumInvoincing(List<InvoicingRecord> listinvoincing) {
  double sum = 0;
  if (listinvoincing != null) {
    for (final value in listinvoincing) {
      sum = sum + value.totalAgain;
    }
  } else {
    sum = 0;
  }

  return sum;
}

double calculateRefundValue(double value) {
  dynamic percent = 0.6;

  return value * percent;
}

int getNumberOfRequestsFinalized(List<RequestsRecord> requests) {
  List<RequestsRecord> list = [];
  requests.forEach((request) {
    if (request.status == "finalized") {
      list.add(request);
    }
  });
  return list.length;
}
