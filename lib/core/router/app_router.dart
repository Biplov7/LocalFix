import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:localfix/core/router/app_name.dart';
import 'package:localfix/injection.dart' as di;
import 'package:localfix/main_screen.dart';
import 'package:localfix/presentation/auth/bloc/auth_bloc.dart';
import 'package:localfix/presentation/auth/view/login.dart';
import 'package:localfix/presentation/auth/view/signup.dart';
import 'package:localfix/presentation/booking/view/booking.dart';
import 'package:localfix/presentation/home/view/home.dart';
import 'package:localfix/presentation/notification/view/notification.dart';
import 'package:localfix/presentation/profile/view/profile.dart';
import 'package:localfix/presentation/search/view/search.dart';
import 'package:localfix/presentation/splash/screen/main_boarding.dart';
import 'package:localfix/presentation/splash/screen/splash.dart';

class AppRouter {
  static final GoRouter route = GoRouter(
    // initialLocation: '/splash',
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: AppName.splashName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => di.sl<AuthBloc>(),
            child: const Splash(),
          );
        },
      ),
      GoRoute(
        path: '/boarding',
        name: AppName.boardingName,
        builder: (context, state) {
          return const MainBoarding();
        },
      ),
      GoRoute(
        name: AppName.loginName,
        path: '/login',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: BlocProvider(
              create: (context) => di.sl<AuthBloc>(),
              child: const Login(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
          );
        },
      ),
      GoRoute(
        path: '/signup',
        name: AppName.signupName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => di.sl<AuthBloc>(),
            child: const Signup(),
          );
        },
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: AppName.homeName,
                builder: (context, state) {
                  return const Home();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                name: AppName.searchName,
                builder: (context, state) {
                  return Search();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/booking',
                name: AppName.bookingName,
                builder: (context, state) {
                  return Booking();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/notification',
                name: AppName.notificationName,
                builder: (context, state) {
                  return Notifications();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: AppName.profileName,
                builder: (context, state) {
                  return Profile();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
