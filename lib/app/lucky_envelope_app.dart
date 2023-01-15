import 'dart:math';

import 'package:flutter/material.dart';

final _rand = Random();

class LuckyEnvelopeApp extends StatefulWidget {
  const LuckyEnvelopeApp({Key? key}) : super(key: key);

  @override
  State<LuckyEnvelopeApp> createState() => _LuckyEnvelopeAppState();
}

class _LuckyEnvelopeAppState extends State<LuckyEnvelopeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: LayoutBuilder(
        builder: (context, constrain) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return Image.asset(
              'assets/images/envolopes/envolope${_rand.nextInt(12) + 1}.png',
              width: (constrain.maxWidth / 4) - 16, fit: BoxFit.fitWidth,
            );
          },
          itemCount: 20,
        ),
      )),
    );
  }
}
