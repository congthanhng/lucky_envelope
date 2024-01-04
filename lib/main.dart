import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lucky_envolope/shared/shelf.dart';

import 'app/presentation/my_app.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
