import 'package:flutter/material.dart';
import 'package:lucky_envolope/app/presentation/shelf.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return UICircularLoading(
      child: Assets.icon.icLoading.image(),
    );
  }
}
