import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_envolope/app/presentation/routes/route_named.dart';

import '../pages/shelf.dart';

class AppRouteConfig {
  static final config = GoRouter(
      debugLogDiagnostics: true,
      //TODO: implement observers
      observers: <NavigatorObserver>[RouteObserver<PageRoute>()],
      initialLocation: RouteNamed.home.named,
      routes: [
        SplashPage.routeConfig(),
        HomePage.routeConfig(),
      ]);
}
