import 'package:flutter/material.dart';
import 'package:lucky_envolope/gen/assets.gen.dart';
import 'package:lucky_envolope/shared/widgets/loading/ui_circular_loading.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return UICircularLoading(
      child: Assets.icon.icLoading.image(),
    );
  }
}
