import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_envolope/app/presentation/routes/route_named.dart';

class HomeScreen extends StatelessWidget {

  static routeConfig({List<RouteBase>? routes}) => GoRoute(
      name: RouteNamed.home.named,
      path: RouteNamed.home.path,
      onExit: (context) {
        //TODO: implement confirm before exit
        return false;
      },
      redirect: (context, state) {},
      pageBuilder: (context, state) =>
      const NoTransitionPage(child: HomeScreen()),
      routes: routes ?? []);


  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
