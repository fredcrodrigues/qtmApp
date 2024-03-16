import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? LoadAuthPageWidget() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? LoadAuthPageWidget()
              : LoginPageWidget(),
        ),
        FFRoute(
          name: 'home_patient_page',
          path: '/homePatientPage',
          builder: (context, params) => HomePatientPageWidget(),
        ),
        FFRoute(
          name: 'initial_search',
          path: '/initialSearch',
          builder: (context, params) => InitialSearchWidget(),
        ),
        FFRoute(
          name: 'search',
          path: '/search',
          builder: (context, params) => SearchWidget(
            search: params.getParam('search', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'requests_page',
          path: '/requestsPage',
          builder: (context, params) => RequestsPageWidget(
            filterParam: params.getParam('filterParam', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'profile_therapist',
          path: '/profileTherapist',
          asyncParams: {
            'theraphist': getDoc(['theraphist'], TheraphistRecord.fromSnapshot),
          },
          builder: (context, params) => ProfileTherapistWidget(
            theraphist: params.getParam('theraphist', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'terms_page',
          path: '/termsPage',
          builder: (context, params) => TermsPageWidget(),
        ),
        FFRoute(
          name: 'payment_cards',
          path: '/paymentCards',
          builder: (context, params) => PaymentCardsWidget(),
        ),
        FFRoute(
          name: 'confirm_schedule',
          path: '/confirmSchedule',
          asyncParams: {
            'theraphist': getDoc(['theraphist'], TheraphistRecord.fromSnapshot),
            'patient': getDoc(['patients'], PatientsRecord.fromSnapshot),
            'practice': getDoc(['practice'], PracticeRecord.fromSnapshot),
            'coworking': getDoc(['coworking'], CoworkingRecord.fromSnapshot),
          },
          builder: (context, params) => ConfirmScheduleWidget(
            theraphist: params.getParam('theraphist', ParamType.Document),
            patient: params.getParam('patient', ParamType.Document),
            timer: params.getParam('timer', ParamType.DateTime),
            practice: params.getParam('practice', ParamType.Document),
            coworking: params.getParam('coworking', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'choose_timers',
          path: '/chooseTimers',
          asyncParams: {
            'theraphist': getDoc(['theraphist'], TheraphistRecord.fromSnapshot),
          },
          builder: (context, params) => ChooseTimersWidget(
            theraphist: params.getParam('theraphist', ParamType.Document),
            timer: params.getParam('timer', ParamType.DateTime),
            numberCowokrings:
                params.getParam('numberCowokrings', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'choose_practices',
          path: '/choosePractices',
          asyncParams: {
            'theraphist': getDoc(['theraphist'], TheraphistRecord.fromSnapshot),
          },
          builder: (context, params) => ChoosePracticesWidget(
            theraphist: params.getParam('theraphist', ParamType.Document),
            horary: params.getParam('horary', ParamType.DateTime),
            numbercowokings: params.getParam('numbercowokings', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'manager_requests',
          path: '/managerRequests',
          builder: (context, params) => ManagerRequestsWidget(),
        ),
        FFRoute(
          name: 'payment_confirm',
          path: '/paymentConfirm',
          asyncParams: {
            'theraphist': getDoc(['theraphist'], TheraphistRecord.fromSnapshot),
            'practice': getDoc(['practice'], PracticeRecord.fromSnapshot),
            'coworking': getDoc(['coworking'], CoworkingRecord.fromSnapshot),
          },
          builder: (context, params) => PaymentConfirmWidget(
            theraphist: params.getParam('theraphist', ParamType.Document),
            timer: params.getParam('timer', ParamType.DateTime),
            practice: params.getParam('practice', ParamType.Document),
            coworking: params.getParam('coworking', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'schedulePage',
          path: '/schedulePage',
          asyncParams: {
            'request': getDoc(['requests'], RequestsRecord.fromSnapshot),
          },
          builder: (context, params) => SchedulePageWidget(
            request: params.getParam('request', ParamType.Document),
            reftheraphistUser: params.getParam('reftheraphistUser',
                ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'login_page',
          path: '/loginPage',
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: 'schedulings_page',
          path: '/schedulingsPage',
          builder: (context, params) => SchedulingsPageWidget(
            refTheraphist: params.getParam('refTheraphist',
                ParamType.DocumentReference, false, ['theraphist']),
          ),
        ),
        FFRoute(
          name: 'home_theraphist_page',
          path: '/homeTheraphistPage',
          builder: (context, params) => HomeTheraphistPageWidget(
            intro: params.getParam('intro', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'load_auth_page',
          path: '/loadAuthPage',
          builder: (context, params) => LoadAuthPageWidget(),
        ),
        FFRoute(
          name: 'schedules_theraphist_page',
          path: '/schedulesTheraphistPage',
          builder: (context, params) => SchedulesTheraphistPageWidget(
            refTheraphist: params.getParam('refTheraphist',
                ParamType.DocumentReference, false, ['theraphist']),
          ),
        ),
        FFRoute(
          name: 'patients_page_theraphist',
          path: '/patientsPageTheraphist',
          builder: (context, params) => PatientsPageTheraphistWidget(
            refTheraphist: params.getParam('refTheraphist',
                ParamType.DocumentReference, false, ['theraphist']),
          ),
        ),
        FFRoute(
          name: 'signup_register_user_page',
          path: '/signupRegisterUserPage',
          builder: (context, params) => SignupRegisterUserPageWidget(),
        ),
        FFRoute(
          name: 'type_user_page',
          path: '/typeUserPage',
          builder: (context, params) => TypeUserPageWidget(),
        ),
        FFRoute(
          name: 'register_theraphist_page',
          path: '/registerTheraphistPage',
          builder: (context, params) => RegisterTheraphistPageWidget(),
        ),
        FFRoute(
          name: 'profile_update_user_page',
          path: '/profileUpdateUserPage',
          builder: (context, params) => ProfileUpdateUserPageWidget(
            refUser: params.getParam(
                'refUser', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'add_timer_theraphist_page',
          path: '/addTimerTheraphistPage',
          builder: (context, params) => AddTimerTheraphistPageWidget(),
        ),
        FFRoute(
          name: 'add_pratical_theraphist_page',
          path: '/addPraticalTheraphistPage',
          builder: (context, params) => AddPraticalTheraphistPageWidget(),
        ),
        FFRoute(
          name: 'add_place_theraphist_page',
          path: '/addPlaceTheraphistPage',
          builder: (context, params) => AddPlaceTheraphistPageWidget(),
        ),
        FFRoute(
          name: 'loading_page_user',
          path: '/loadingPageUser',
          builder: (context, params) => LoadingPageUserWidget(
            userRef: params.getParam(
                'userRef', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'profile_patient_page',
          path: '/profilePatientPage',
          builder: (context, params) => ProfilePatientPageWidget(
            refUser: params.getParam(
                'refUser', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'notification_theraphist_page',
          path: '/notificationTheraphistPage',
          builder: (context, params) => NotificationTheraphistPageWidget(
            intro: params.getParam('intro', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'praticals_theraphist_page',
          path: '/praticalsTheraphistPage',
          builder: (context, params) => PraticalsTheraphistPageWidget(),
        ),
        FFRoute(
          name: 'add_praticals_page',
          path: '/addPraticalsPage',
          builder: (context, params) => AddPraticalsPageWidget(),
        ),
        FFRoute(
          name: 'add_timers_page',
          path: '/addTimersPage',
          builder: (context, params) => AddTimersPageWidget(),
        ),
        FFRoute(
          name: 'calendar_theraphist_page',
          path: '/calendarTheraphistPage',
          builder: (context, params) => CalendarTheraphistPageWidget(),
        ),
        FFRoute(
          name: 'register_patient_page',
          path: '/registerPatientPage',
          builder: (context, params) => RegisterPatientPageWidget(),
        ),
        FFRoute(
          name: 'terms_inital_page',
          path: '/termsInitalPage',
          builder: (context, params) => TermsInitalPageWidget(),
        ),
        FFRoute(
          name: 'politics_inital_privacy_page',
          path: '/politicsInitalPrivacyPage',
          builder: (context, params) => PoliticsInitalPrivacyPageWidget(),
        ),
        FFRoute(
          name: 'politic_general_use_page',
          path: '/politicGeneralUsePage',
          builder: (context, params) => PoliticGeneralUsePageWidget(),
        ),
        FFRoute(
          name: 'coworking_theraphist_page',
          path: '/coworkingTheraphistPage',
          builder: (context, params) => CoworkingTheraphistPageWidget(),
        ),
        FFRoute(
          name: 'statusCancel',
          path: '/statusCancel',
          asyncParams: {
            'request': getDoc(['requests'], RequestsRecord.fromSnapshot),
          },
          builder: (context, params) => StatusCancelWidget(
            request: params.getParam('request', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'choose_coworkings',
          path: '/chooseCoworkings',
          asyncParams: {
            'theraphist': getDoc(['theraphist'], TheraphistRecord.fromSnapshot),
            'chosedPratice': getDoc(['practice'], PracticeRecord.fromSnapshot),
          },
          builder: (context, params) => ChooseCoworkingsWidget(
            theraphist: params.getParam('theraphist', ParamType.Document),
            horary: params.getParam('horary', ParamType.DateTime),
            chosedPratice: params.getParam('chosedPratice', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'notification_patient_page',
          path: '/notificationPatientPage',
          builder: (context, params) => NotificationPatientPageWidget(),
        ),
        FFRoute(
          name: 'errorApi',
          path: '/errorApi',
          builder: (context, params) => ErrorApiWidget(),
        ),
        FFRoute(
          name: 'history_requests_patients_page',
          path: '/historyRequestsPatientsPage',
          builder: (context, params) => HistoryRequestsPatientsPageWidget(),
        ),
        FFRoute(
          name: 'invoincing_theraphist_page',
          path: '/invoincingTheraphistPage',
          builder: (context, params) => InvoincingTheraphistPageWidget(),
        ),
        FFRoute(
          name: 'interest_page',
          path: '/interestPage',
          asyncParams: {
            'interest': getDoc(['interest'], InterestRecord.fromSnapshot),
          },
          builder: (context, params) => InterestPageWidget(
            interest: params.getParam('interest', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'history_requests_theraphist_page',
          path: '/historyRequestsTheraphistPage',
          builder: (context, params) => HistoryRequestsTheraphistPageWidget(),
        ),
        FFRoute(
          name: 'politics_drawer_page',
          path: '/politicsDrawerPage',
          builder: (context, params) => PoliticsDrawerPageWidget(),
        ),
        FFRoute(
          name: 'terms_drawer_page',
          path: '/termsDrawerPage',
          builder: (context, params) => TermsDrawerPageWidget(),
        ),
        FFRoute(
          name: 'managerRequestHistory',
          path: '/managerRequestHistory',
          asyncParams: {
            'request': getDoc(['requests'], RequestsRecord.fromSnapshot),
          },
          builder: (context, params) => ManagerRequestHistoryWidget(
            request: params.getParam('request', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'redirect_finished_page',
          path: '/redirectFinishedPage',
          builder: (context, params) => RedirectFinishedPageWidget(),
        ),
        FFRoute(
          name: 'profile_theraphist_page',
          path: '/profileUpdate',
          builder: (context, params) => ProfileTheraphistPageWidget(
            refUser: params.getParam(
                'refUser', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'redirect_continue_page',
          path: '/redirectContinuePage',
          builder: (context, params) => RedirectContinuePageWidget(),
        ),
        FFRoute(
          name: 'screenSupport',
          path: '/screenSupport',
          builder: (context, params) => ScreenSupportWidget(),
        ),
        FFRoute(
          name: 'supportForm',
          path: '/supportForm',
          builder: (context, params) => SupportFormWidget(),
        ),
        FFRoute(
          name: 'supportConsultas',
          path: '/supportRequests',
          builder: (context, params) => SupportConsultasWidget(),
        ),
        FFRoute(
          name: 'supportRequestFinished',
          path: '/supportRequestFinished',
          asyncParams: {
            'request': getDoc(['requests'], RequestsRecord.fromSnapshot),
          },
          builder: (context, params) => SupportRequestFinishedWidget(
            request: params.getParam('request', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'home_page_admin',
          path: '/homePageAdmin',
          builder: (context, params) => HomePageAdminWidget(),
        ),
        FFRoute(
          name: 'registred_theraphist_page',
          path: '/registredTheraphistPage',
          builder: (context, params) => RegistredTheraphistPageWidget(),
        ),
        FFRoute(
          name: 'registred_patients_page',
          path: '/registredPatientsPage',
          builder: (context, params) => RegistredPatientsPageWidget(),
        ),
        FFRoute(
          name: 'users_page',
          path: '/usersPage',
          asyncParams: {
            'refPacient': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => UsersPageWidget(
            refPacient: params.getParam('refPacient', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'profile_patient',
          path: '/profilePatient',
          builder: (context, params) => ProfilePatientWidget(),
        ),
        FFRoute(
          name: 'edit_profile',
          path: '/editProfile',
          builder: (context, params) => EditProfileWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
