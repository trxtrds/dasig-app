import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
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
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
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
      errorBuilder: (context, _) => appStateNotifier.loggedIn
          ? UserLoginPageWidget()
          : RegisterPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? UserLoginPageWidget()
              : RegisterPageWidget(),
          routes: [
            FFRoute(
              name: 'profilePage',
              path: 'profilePage',
              builder: (context, params) => ProfilePageWidget(),
            ),
            FFRoute(
              name: 'registerPage',
              path: 'registerPage',
              builder: (context, params) => RegisterPageWidget(),
            ),
            FFRoute(
              name: 'user_loginPage',
              path: 'userLoginPage',
              builder: (context, params) => UserLoginPageWidget(),
            ),
            FFRoute(
              name: 'admin_loginPage',
              path: 'adminLoginPage',
              builder: (context, params) => AdminLoginPageWidget(),
            ),
            FFRoute(
              name: 'PosEvalPage',
              path: 'posEvalPage',
              asyncParams: {
                'isDoneMoodTracker':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
              },
              builder: (context, params) => PosEvalPageWidget(
                isDoneMoodTracker:
                    params.getParam('isDoneMoodTracker', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'dashboardPage',
              path: 'dashboardPage',
              asyncParams: {
                'isDoneEntry':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'dateTime':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
              },
              builder: (context, params) => DashboardPageWidget(
                isDoneEntry: params.getParam('isDoneEntry', ParamType.Document),
                dateTime: params.getParam('dateTime', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'Q2',
              path: 'q2',
              builder: (context, params) => Q2Widget(),
            ),
            FFRoute(
              name: 'Q3',
              path: 'q3',
              builder: (context, params) => Q3Widget(),
            ),
            FFRoute(
              name: 'Q1',
              path: 'q1',
              builder: (context, params) => Q1Widget(),
            ),
            FFRoute(
              name: 'Q4',
              path: 'q4',
              builder: (context, params) => Q4Widget(),
            ),
            FFRoute(
              name: 'moodJournal',
              path: 'moodJournal',
              builder: (context, params) => MoodJournalWidget(
                displayJournalEntriesDaily: params.getParam(
                    'displayJournalEntriesDaily',
                    ParamType.DocumentReference,
                    false,
                    ['moodTracker']),
              ),
            ),
            FFRoute(
              name: 'Q5',
              path: 'q5',
              asyncParams: {
                'isDoneMoodTracker':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'journalEntry':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
              },
              builder: (context, params) => Q5Widget(
                isDoneMoodTracker:
                    params.getParam('isDoneMoodTracker', ParamType.Document),
                journalEntry:
                    params.getParam('journalEntry', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'journal_page',
              path: 'journalPage',
              asyncParams: {
                'displaytitle':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'displaybody':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'displaydate':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
              },
              builder: (context, params) => JournalPageWidget(
                displaytitle:
                    params.getParam('displaytitle', ParamType.Document),
                displaybody: params.getParam('displaybody', ParamType.Document),
                displaydate: params.getParam('displaydate', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'admin_dashboardPage',
              path: 'adminDashboardPage',
              builder: (context, params) => AdminDashboardPageWidget(),
            ),
            FFRoute(
              name: 'displayJournalDetails',
              path: 'displayJournalDetails',
              asyncParams: {
                'displayDate':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'displayTitle':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'displayDescription':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
              },
              builder: (context, params) => DisplayJournalDetailsWidget(
                displayDate: params.getParam('displayDate', ParamType.Document),
                displayTitle:
                    params.getParam('displayTitle', ParamType.Document),
                displayDescription:
                    params.getParam('displayDescription', ParamType.Document),
                lastEntryDate:
                    params.getParam('lastEntryDate', ParamType.DateTimeRange),
              ),
            ),
            FFRoute(
              name: 'noJournal',
              path: 'noJournal',
              builder: (context, params) => NoJournalWidget(),
            ),
            FFRoute(
              name: 'moodScoreDetails',
              path: 'moodScoreDetails',
              builder: (context, params) => MoodScoreDetailsWidget(),
            ),
            FFRoute(
              name: 'usersMoodScores',
              path: 'usersMoodScores',
              builder: (context, params) => UsersMoodScoresWidget(),
            ),
            FFRoute(
              name: 'displayMoodScore',
              path: 'displayMoodScore',
              asyncParams: {
                'userName':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'lastEntryDate':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'totalScore':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
              },
              builder: (context, params) => DisplayMoodScoreWidget(
                userName: params.getParam('userName', ParamType.Document),
                lastEntryDate:
                    params.getParam('lastEntryDate', ParamType.Document),
                totalScore: params.getParam('totalScore', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'NegaEvalPage',
              path: 'negaEvalPage',
              asyncParams: {
                'isDoneMoodTracker':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
              },
              builder: (context, params) => NegaEvalPageWidget(
                isDoneMoodTracker:
                    params.getParam('isDoneMoodTracker', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'NeuEvalPage',
              path: 'neuEvalPage',
              asyncParams: {
                'isDoneMoodTracker':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
              },
              builder: (context, params) => NeuEvalPageWidget(
                isDoneMoodTracker:
                    params.getParam('isDoneMoodTracker', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'moodTrackerList',
              path: 'moodTrackerList',
              builder: (context, params) => MoodTrackerListWidget(),
            ),
            FFRoute(
              name: 'displayMoodTracker',
              path: 'displayMoodTracker',
              asyncParams: {
                'q1': getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'q2': getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'q3': getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'q4': getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'q5': getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'totalScore':
                    getDoc(['moodTracker'], MoodTrackerRecord.serializer),
                'date': getDoc(['moodTracker'], MoodTrackerRecord.serializer),
              },
              builder: (context, params) => DisplayMoodTrackerWidget(
                q1: params.getParam('q1', ParamType.Document),
                q2: params.getParam('q2', ParamType.Document),
                q3: params.getParam('q3', ParamType.Document),
                q4: params.getParam('q4', ParamType.Document),
                q5: params.getParam('q5', ParamType.Document),
                totalScore: params.getParam('totalScore', ParamType.Document),
                date: params.getParam('date', ParamType.Document),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
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
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
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
    return deserializeParam<T>(param, type, isList, collectionNamePath);
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
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/registerPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
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
