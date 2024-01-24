import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/setting_bloc.dart';
import 'setting_layout.dart';

class SettingPage extends StatefulWidget {
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
