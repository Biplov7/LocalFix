import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:localfix/core/router/app_name.dart';
import 'package:localfix/injection.dart' as di;
import 'package:localfix/presentation/auth/bloc/auth_bloc.dart';
import 'package:localfix/presentation/auth/view/login.dart';
import 'package:localfix/presentation/auth/view/signup.dart';
import 'package:localfix/presentation/dashboard/view/dashboard_view.dart';
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
          return Splash();
        },
      ),
      GoRoute(
        path: '/boarding',
        name: AppName.boardingName,
        builder: (context, state) {
          return MainBoarding();
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
            child: Signup(),
          );
        },
      ),
      GoRoute(path: '/dashboard',
      name: AppName.dashboardName,
      builder: (context, state) {
        return DashboardView();
      },)
    ],
  );
}
