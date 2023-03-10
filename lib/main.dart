import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lucky_envolope/app/core/bloc/bloc_middleware.dart';
import 'package:lucky_envolope/app/lucky_envelope_app.dart';
import 'package:lucky_envolope/app/presentation/blocs/draw/draw_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/envelope_set/envelope_set_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EnvelopeSetBloc>(
          create: (context) => EnvelopeSetBloc()..add(EnvelopeSetFetched()),
        ),
        BlocProvider<DrawBloc>(
          create: (context) => DrawBloc()..add(DrawFetched()),
        )
      ],
      child: MaterialApp(
          title: 'Lucky Envelope',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LuckyEnvelopeApp()),
    );
  }
}
