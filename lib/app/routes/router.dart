import 'package:flutter/material.dart';
import 'package:hacker_news/app/routes/routes.dart';
import 'package:hacker_news/presentation/app_home/app_home_view.dart';
import 'package:hacker_news/presentation/login/login_view.dart';
import 'package:hacker_news/presentation/otp_verification/otp_verification_view.dart';
import 'package:hacker_news/presentation/sign_up/sign_up_view.dart';
import 'package:hacker_news/presentation/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter _router = GoRouter(
  initialLocation: Routes.splashRoutes.parentRoute,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.splashRoutes.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: Routes.authRoutes.parentRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: Routes.authRoutes.loginScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: Routes.authRoutes.signupScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpPage();
          },
        ),
        GoRoute(
          path: Routes.authRoutes.verifyOtpScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const OtpVerificationPage();
          },
        ),
      ],
    ),
    GoRoute(
      path: Routes.appRoutes.parentRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const AppHomePage();
      },
    ),
  ],
);

 GoRouter get router => _router;
