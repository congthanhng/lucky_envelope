import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_envolope/app/presentation/routes/route_named.dart';

import 'withdraw_layout.dart';

class WithdrawPage extends StatefulWidget {
  static routeConfig({List<RouteBase>? routes}) => GoRoute(
      name: RouteNamed.withdraw.named,
      path: RouteNamed.withdraw.path,
      onExit: (context) {
        //TODO: implement confirm before exit
        return false;
      },
      redirect: (context, state) {},
      pageBuilder: (context, state) =>
      const NoTransitionPage(child: WithdrawPage()),
      routes: routes ?? []);

  const WithdrawPage({Key? key}) : super(key: key);

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
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
      body: const SafeArea(child: WithdrawLayout()),
    );
  }
}
