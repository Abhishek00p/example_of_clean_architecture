import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:societymanager/presentation/auth/forgot_password.dart';
import 'package:societymanager/presentation/auth/login.dart';
import 'package:societymanager/presentation/auth/register.dart';
import 'package:societymanager/presentation/home/home_parent.dart';
import 'package:societymanager/presentation/home/homepage.dart';
import 'package:societymanager/presentation/home/search_page.dart';

class RouteStrings {
  //login screen
  static const login = '/';

  //forget password
  static const forgotPassword = '/forgotPassword';

  //create password
  static const createPassword = '/createPassword';

  //register
  static const register = '/register';
  // Homepage
  static const homePage = '/homepage';

  //Messages
  static const messages = '/messages';

  //ChatRoom
  static const chatroom = '/chatroom';
  //No Internet
  static const noInternetScreen = '/noInternet';
  //Location
  static const locationScreen = '/locationScreen';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Homekey');
final _shellNavigatorMessageKey =
    GlobalKey<NavigatorState>(debugLabel: 'Message');

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  // redirect: (context, state) {
  //   final status = context.watch<AppBloc>().state.status;
  //   //   debugPrint('App Router: Redirect func $status');

  //   if (status == AppStatus.authenticated) {
  //     if (state.fullPath == RouteStrings.login) {
  //       return RouteStrings.homePage;
  //     }
  //   }

  //   if (status == AppStatus.unauthenticated) {
  //     /// Provide path where log out is called
  //     if (state.fullPath == RouteStrings.homePage) {
  //       return RouteStrings.login;
  //     }
  //   }
  //   return null;
  // },
  routes: [
    GoRoute(
      //   // parentNavigatorKey: _rootNavigatorKey,
      path: '/',
      name: 'Login Page',
      builder: (BuildContext context, GoRouterState state) => const LoginPageScreen(),
    ),
    GoRoute(
      //   // parentNavigatorKey: _rootNavigatorKey,
      path: '/register',
      name: 'Register Page',
      builder: (BuildContext context, GoRouterState state) =>
          const RegisterScreen(),
    ),
    GoRoute(
      //   // parentNavigatorKey: _rootNavigatorKey,
      path: '/forgotPassword',
      name: 'ForgotPassword Page',
      builder: (BuildContext context, GoRouterState state) =>
          const ForgotPasswordScreen(),
    ),
    StatefulShellRoute.indexedStack(
      branches: [
        // Home
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: <RouteBase>[
            GoRoute(
              path: RouteStrings.homePage,
              name: 'Home',
              builder: (BuildContext context, GoRouterState state) =>
                  const HomePage(),
              routes: [
                GoRoute(
                  path: 'search',
                  name: 'SearchScreen',
                  parentNavigatorKey: _shellNavigatorHomeKey,
                  pageBuilder: (context, state) => CustomTransitionPage<void>(
                    key: state.pageKey,
                    child: const SearchScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                ),
              ],
            ),
          ],
        ),

      ],
      builder: (context, state, navigationShell) {
        return HomeParent(
          navigationShell: navigationShell,
        );
      },
    ),
  ],
);
