import 'package:flutter/material.dart';

abstract base class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  Widget viewBuilder(BuildContext context);

  Widget loadingBuilder(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [viewBuilder(context), loadingBuilder(context)],
      ),
    );
  }
}
