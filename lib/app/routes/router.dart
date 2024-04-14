import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_news/app/routes/routes.dart';
import 'package:hacker_news/presentation/news/news_page.dart';
import 'package:hacker_news/presentation/splash/splash_view.dart';
import 'package:hacker_news/presentation/web_view/web_view_page.dart';

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
      path: Routes.appRoutes.parentRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const NewsPage();
      },
      routes: [
        GoRoute(
          path: Routes.appRoutes.webView,
          builder: (BuildContext context, GoRouterState state) {
            final url = state.extra as String?;
            return WebViewPage(
              url: url ?? '',
            );
          },
        ),
      ],
    ),
  ],
);

GoRouter get router => _router;
