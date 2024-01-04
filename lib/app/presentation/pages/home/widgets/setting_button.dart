import 'package:flutter/material.dart';

import 'default_draw.dart';
import '../../pages.dart';

class HomeSettingButton extends StatelessWidget {
  const HomeSettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Cài đặt bộ lì xì',
      onPressed: () {
        CustomDraws.showHelpDraw(context: context, body: [
          SettingPage(
            onCreated: () {
              Navigator.pop(context);
            },
          )
        ]);
      },
      icon: const Icon(
        Icons.settings,
        color: Colors.white,
      ),
    );
  }
}
