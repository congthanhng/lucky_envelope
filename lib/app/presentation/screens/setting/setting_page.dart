import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_envolope/app/presentation/routes/route_named.dart';

import 'bloc/setting_bloc.dart';
import 'setting_layout.dart';

class SettingPage extends StatefulWidget {
  static routeConfig({List<RouteBase>? routes}) => GoRoute(
      name: RouteNamed.setting.named,
      path: RouteNamed.setting.path,
      onExit: (context) {
        //TODO: implement confirm before exit
        return false;
      },
      redirect: (context, state) {},
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SettingPage()),
      routes: routes ?? []);

  const SettingPage({Key? key, this.onCreated}) : super(key: key);

  final VoidCallback? onCreated;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingBloc>(
      create: (context) => SettingBloc(),
      child: SettingLayout(onCreated: widget.onCreated),
    );
  }
}
