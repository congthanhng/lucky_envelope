import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/draw/draw_bloc.dart';
import 'blocs/envelope_set/envelope_set_bloc.dart';
import 'routes/app_route.dart';

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
      child: MaterialApp.router(
        routerConfig: AppRoute.config,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
