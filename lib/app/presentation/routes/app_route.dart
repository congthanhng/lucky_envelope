import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_envolope/app/presentation/routes/route_named.dart';
import 'package:lucky_envolope/app/presentation/screens/shelf.dart';

class AppRoute {
  static final config = GoRouter(

      // errorPageBuilder: (context, state) {
      //   //TODO: implement error builder
      // },
      debugLogDiagnostics: true,
      redirect: (context, state) {
        //Redirect before go
      },
      //TODO: implement observers
      observers: <NavigatorObserver>[RouteObserver<PageRoute>()],
      initialLocation: RouteNamed.splash.path,
      routes: [
        SplashScreen.routeConfig(),
        HomeScreen.routeConfig(
            routes: [WithdrawPage.routeConfig(), SettingPage.routeConfig()]),
      ]);
}
