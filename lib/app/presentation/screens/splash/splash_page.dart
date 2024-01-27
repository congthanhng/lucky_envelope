import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_named.dart';

class SplashPage extends StatelessWidget {
  static routeConfig({List<RouteBase>? routes}) => GoRoute(
      name: RouteNamed.splash.named,
      path: RouteNamed.splash.path,
      onExit: (context) {
        //TODO: implement confirm before exit
        return false;
      },
      redirect: (context, state) {},
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SplashPage()),
      routes: routes ?? []);

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
