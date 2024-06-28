import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

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
          appStateNotifier.loggedIn ? const NavBarPage() : const MobileSignInPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const NavBarPage()
              : const MobileSignInPageWidget(),
        ),
        FFRoute(
          name: 'BuyingPage',
          path: '/buyingPage',
          requireAuth: true,
          builder: (context, params) => const BuyingPageWidget(),
        ),
        FFRoute(
          name: 'MobileSignInPage',
          path: '/mobileSignInPage',
          builder: (context, params) => const MobileSignInPageWidget(),
        ),
        FFRoute(
          name: 'OtpPage',
          path: '/otpPage',
          builder: (context, params) => OtpPageWidget(
            mobileNumber: params.getParam(
              'mobileNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'OnboardingPage',
          path: '/onboardingPage',
          requireAuth: true,
          builder: (context, params) => const OnboardingPageWidget(),
        ),
        FFRoute(
          name: 'DashboardPage',
          path: '/dashboardPage',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'DashboardPage')
              : const DashboardPageWidget(),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'ProfilePage')
              : const ProfilePageWidget(),
        ),
        FFRoute(
          name: 'PortfolioPage',
          path: '/portfolioPage',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'PortfolioPage')
              : const PortfolioPageWidget(),
        ),
        FFRoute(
          name: 'PurchaseSuccessPage',
          path: '/purchaseSuccessPage',
          requireAuth: true,
          builder: (context, params) => PurchaseSuccessPageWidget(
            amount: params.getParam(
              'amount',
              ParamType.String,
            ),
            gold: params.getParam(
              'gold',
              ParamType.double,
            ),
            goldPrice: params.getParam(
              'goldPrice',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'WithdrawSuccessfulPage',
          path: '/withdrawSuccessfulPage',
          requireAuth: true,
          builder: (context, params) => WithdrawSuccessfulPageWidget(
            amount: params.getParam(
              'amount',
              ParamType.String,
            ),
            gold: params.getParam(
              'gold',
              ParamType.String,
            ),
            upiId: params.getParam(
              'upiId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SellingPage',
          path: '/sellingPage',
          requireAuth: true,
          builder: (context, params) => const SellingPageWidget(),
        ),
        FFRoute(
          name: 'LoadingScreen',
          path: '/loadingScreen',
          requireAuth: true,
          builder: (context, params) => const LoadingScreenWidget(),
        ),
        FFRoute(
          name: 'MarketplacePage',
          path: '/marketplacePage',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'MarketplacePage')
              : const MarketplacePageWidget(),
        ),
        FFRoute(
          name: 'AddressBookPage',
          path: '/addressBookPage',
          requireAuth: true,
          builder: (context, params) => const AddressBookPageWidget(),
        ),
        FFRoute(
          name: 'PaymentMethodsPage',
          path: '/paymentMethodsPage',
          requireAuth: true,
          builder: (context, params) => const PaymentMethodsPageWidget(),
        ),
        FFRoute(
          name: 'SavingsPlanPage1',
          path: '/savingsPlanPage1',
          requireAuth: true,
          builder: (context, params) => const SavingsPlanPage1Widget(),
        ),
        FFRoute(
          name: 'SavingsPlanPage2',
          path: '/savingsPlanPage2',
          requireAuth: true,
          builder: (context, params) => const SavingsPlanPage2Widget(),
        ),
        FFRoute(
          name: 'SavingsPlanCheckoutPage',
          path: '/savingsPlanCheckoutPage',
          requireAuth: true,
          builder: (context, params) => SavingsPlanCheckoutPageWidget(
            amountEntered: params.getParam(
              'amountEntered',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'PurchaseFailurePage',
          path: '/purchaseFailurePage',
          requireAuth: true,
          builder: (context, params) => const PurchaseFailurePageWidget(),
        ),
        FFRoute(
          name: 'WithdrawFailurePage',
          path: '/withdrawFailurePage',
          requireAuth: true,
          builder: (context, params) => WithdrawFailurePageWidget(
            upiId: params.getParam(
              'upiId',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SpinTheWheelPage',
          path: '/spinTheWheelPage',
          requireAuth: true,
          builder: (context, params) => const SpinTheWheelPageWidget(),
        ),
        FFRoute(
          name: 'AppSecurityPage',
          path: '/appSecurityPage',
          requireAuth: true,
          builder: (context, params) => const AppSecurityPageWidget(),
        ),
        FFRoute(
          name: 'ReferAndEarnPage',
          path: '/referAndEarnPage',
          requireAuth: true,
          builder: (context, params) => const ReferAndEarnPageWidget(),
        ),
        FFRoute(
          name: 'TransactionDetailPage',
          path: '/transactionDetailPage',
          requireAuth: true,
          builder: (context, params) => TransactionDetailPageWidget(
            amount: params.getParam(
              'amount',
              ParamType.String,
            ),
            gold: params.getParam(
              'gold',
              ParamType.String,
            ),
            status: params.getParam(
              'status',
              ParamType.bool,
            ),
            time: params.getParam(
              'time',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: 'SupportPage',
          path: '/supportPage',
          requireAuth: true,
          builder: (context, params) => const SupportPageWidget(),
        ),
        FFRoute(
          name: 'ChatSupportPage',
          path: '/chatSupportPage',
          requireAuth: true,
          builder: (context, params) => const ChatSupportPageWidget(),
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
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
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
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/mobileSignInPage';
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
              ? isWeb
                  ? Container()
                  : Container(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      child: Center(
                        child: Image.asset(
                          'assets/images/New_Artboard.gif',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.contain,
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
