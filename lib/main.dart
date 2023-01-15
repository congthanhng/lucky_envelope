import 'package:flutter/material.dart';
import 'package:lucky_envolope/app/lucky_envelope_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lucky Envelope',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LuckyEnvelopeApp()
    );
  }
}


