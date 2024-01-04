import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/draw/draw_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/envelope_set/envelope_set_bloc.dart';
import 'package:lucky_envolope/app/presentation/pages/home/home_layout.dart';

import '../../components/overlays/draws/default_draw.dart';
import '../../components/shelf.dart';
import '../pages.dart';

class HomePage extends StatefulWidget {
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
