import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Center(
            child: Image.asset(
              'assets/images/qtm-removebg-preview.png',
              width: 200.0,
              height: 260.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'home_patient_page': ParameterData.none(),
  'initial_search': ParameterData.none(),
  'search': (data) async => ParameterData(
        allParams: {
          'search': getParameter<String>(data, 'search'),
        },
      ),
  'requests_page': (data) async => ParameterData(
        allParams: {
          'filterParam': getParameter<bool>(data, 'filterParam'),
        },
      ),
  'profile_therapist': (data) async => ParameterData(
        allParams: {
          'theraphist': await getDocumentParameter<TheraphistRecord>(
              data, 'theraphist', TheraphistRecord.fromSnapshot),
        },
      ),
  'terms_page': ParameterData.none(),
  'payment_cards': ParameterData.none(),
  'confirm_schedule': (data) async => ParameterData(
        allParams: {
          'theraphist': await getDocumentParameter<TheraphistRecord>(
              data, 'theraphist', TheraphistRecord.fromSnapshot),
          'patient': await getDocumentParameter<PatientsRecord>(
              data, 'patient', PatientsRecord.fromSnapshot),
          'timer': getParameter<DateTime>(data, 'timer'),
          'practice': await getDocumentParameter<PracticeRecord>(
              data, 'practice', PracticeRecord.fromSnapshot),
          'coworking': await getDocumentParameter<CoworkingRecord>(
              data, 'coworking', CoworkingRecord.fromSnapshot),
        },
      ),
  'choose_timers': (data) async => ParameterData(
        allParams: {
          'theraphist': await getDocumentParameter<TheraphistRecord>(
              data, 'theraphist', TheraphistRecord.fromSnapshot),
          'timer': getParameter<DateTime>(data, 'timer'),
          'numberCowokrings': getParameter<int>(data, 'numberCowokrings'),
        },
      ),
  'choose_practices': (data) async => ParameterData(
        allParams: {
          'theraphist': await getDocumentParameter<TheraphistRecord>(
              data, 'theraphist', TheraphistRecord.fromSnapshot),
          'horary': getParameter<DateTime>(data, 'horary'),
          'numbercowokings': getParameter<int>(data, 'numbercowokings'),
        },
      ),
  'manager_requests': ParameterData.none(),
  'payment_confirm': (data) async => ParameterData(
        allParams: {
          'theraphist': await getDocumentParameter<TheraphistRecord>(
              data, 'theraphist', TheraphistRecord.fromSnapshot),
          'timer': getParameter<DateTime>(data, 'timer'),
          'practice': await getDocumentParameter<PracticeRecord>(
              data, 'practice', PracticeRecord.fromSnapshot),
          'coworking': await getDocumentParameter<CoworkingRecord>(
              data, 'coworking', CoworkingRecord.fromSnapshot),
        },
      ),
  'schedulePage': (data) async => ParameterData(
        allParams: {
          'request': await getDocumentParameter<RequestsRecord>(
              data, 'request', RequestsRecord.fromSnapshot),
          'reftheraphistUser':
              getParameter<DocumentReference>(data, 'reftheraphistUser'),
        },
      ),
  'login_page': ParameterData.none(),
  'schedulings_page': (data) async => ParameterData(
        allParams: {
          'refTheraphist':
              getParameter<DocumentReference>(data, 'refTheraphist'),
        },
      ),
  'home_theraphist_page': (data) async => ParameterData(
        allParams: {
          'intro': getParameter<bool>(data, 'intro'),
        },
      ),
  'load_auth_page': ParameterData.none(),
  'schedules_theraphist_page': (data) async => ParameterData(
        allParams: {
          'refTheraphist':
              getParameter<DocumentReference>(data, 'refTheraphist'),
        },
      ),
  'patients_page_theraphist': (data) async => ParameterData(
        allParams: {
          'refTheraphist':
              getParameter<DocumentReference>(data, 'refTheraphist'),
        },
      ),
  'signup_register_user_page': ParameterData.none(),
  'type_user_page': ParameterData.none(),
  'register_theraphist_page': ParameterData.none(),
  'profile_update_user_page': (data) async => ParameterData(
        allParams: {
          'refUser': getParameter<DocumentReference>(data, 'refUser'),
        },
      ),
  'add_timer_theraphist_page': ParameterData.none(),
  'add_pratical_theraphist_page': ParameterData.none(),
  'add_place_theraphist_page': ParameterData.none(),
  'loading_page_user': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'profile_patient_page': (data) async => ParameterData(
        allParams: {
          'refUser': getParameter<DocumentReference>(data, 'refUser'),
        },
      ),
  'notification_theraphist_page': (data) async => ParameterData(
        allParams: {
          'intro': getParameter<bool>(data, 'intro'),
        },
      ),
  'praticals_theraphist_page': ParameterData.none(),
  'add_praticals_page': ParameterData.none(),
  'add_timers_page': ParameterData.none(),
  'calendar_theraphist_page': ParameterData.none(),
  'register_patient_page': ParameterData.none(),
  'terms_inital_page': ParameterData.none(),
  'politics_inital_privacy_page': ParameterData.none(),
  'politic_general_use_page': ParameterData.none(),
  'coworking_theraphist_page': ParameterData.none(),
  'statusCancel': (data) async => ParameterData(
        allParams: {
          'request': await getDocumentParameter<RequestsRecord>(
              data, 'request', RequestsRecord.fromSnapshot),
        },
      ),
  'choose_coworkings': (data) async => ParameterData(
        allParams: {
          'theraphist': await getDocumentParameter<TheraphistRecord>(
              data, 'theraphist', TheraphistRecord.fromSnapshot),
          'horary': getParameter<DateTime>(data, 'horary'),
          'chosedPratice': await getDocumentParameter<PracticeRecord>(
              data, 'chosedPratice', PracticeRecord.fromSnapshot),
        },
      ),
  'notification_patient_page': ParameterData.none(),
  'errorApi': ParameterData.none(),
  'history_requests_patients_page': ParameterData.none(),
  'invoincing_theraphist_page': ParameterData.none(),
  'interest_page': (data) async => ParameterData(
        allParams: {
          'interest': await getDocumentParameter<InterestRecord>(
              data, 'interest', InterestRecord.fromSnapshot),
        },
      ),
  'history_requests_theraphist_page': ParameterData.none(),
  'politics_drawer_page': ParameterData.none(),
  'terms_drawer_page': ParameterData.none(),
  'managerRequestHistory': (data) async => ParameterData(
        allParams: {
          'request': await getDocumentParameter<RequestsRecord>(
              data, 'request', RequestsRecord.fromSnapshot),
        },
      ),
  'redirect_finished_page': ParameterData.none(),
  'profile_theraphist_page': (data) async => ParameterData(
        allParams: {
          'refUser': getParameter<DocumentReference>(data, 'refUser'),
        },
      ),
  'redirect_continue_page': ParameterData.none(),
  'screenSupport': ParameterData.none(),
  'supportForm': ParameterData.none(),
  'supportConsultas': ParameterData.none(),
  'supportRequestFinished': (data) async => ParameterData(
        allParams: {
          'request': await getDocumentParameter<RequestsRecord>(
              data, 'request', RequestsRecord.fromSnapshot),
        },
      ),
  'home_page_admin': ParameterData.none(),
  'registred_theraphist_page': ParameterData.none(),
  'registred_patients_page': ParameterData.none(),
  'users_page': (data) async => ParameterData(
        allParams: {
          'refPacient': await getDocumentParameter<UsersRecord>(
              data, 'refPacient', UsersRecord.fromSnapshot),
        },
      ),
  'profile_patient': ParameterData.none(),
  'edit_profile': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
