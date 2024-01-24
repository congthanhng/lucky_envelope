import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_envolope/app/presentation/pages/home/home_layout.dart';
import 'package:lucky_envolope/app/presentation/routes/route_named.dart';


class HomePage extends StatefulWidget {

  static routeConfig({List<RouteBase>? routes}) => GoRoute(
      name: RouteNamed.splash.named,
      path: RouteNamed.splash.path,
      onExit: (context) {
        //TODO: implement confirm before exit
        return false;
      },
      redirect: (context, state) {},
      pageBuilder: (context, state) =>
      const NoTransitionPage(child: HomePage()),
      routes: routes ?? []);

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int? itemSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      body: const SafeArea(
          child: HomeLayout()),
    );
  }
}
