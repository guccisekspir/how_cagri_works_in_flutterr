import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:how_cagri_work_on_flutter/pages/auth_page/auth_page.dart';
import 'package:how_cagri_work_on_flutter/pages/splash_page/splash_page.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'auth',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthPage();
          },
        ),
      ],
    ),
  ],
);
