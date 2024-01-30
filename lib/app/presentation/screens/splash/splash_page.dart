import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_envolope/app/presentation/components/loading/app_loading.dart';
import 'package:lucky_envolope/gen/assets.gen.dart';

import '../../routes/route_named.dart';

//TODO: build baseScreen
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
    return const Scaffold(body: AppLoading());

    return Scaffold(
        body: Center(
            child: SizedBox.fromSize(
                size: Size.fromWidth(MediaQuery.sizeOf(context).width / 3),
                child: Assets.icon.logoLogoUp.image())));
  }
}
