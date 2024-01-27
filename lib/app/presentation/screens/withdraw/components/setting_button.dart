import 'package:flutter/material.dart';

import '../../config/setting_page.dart';
import 'default_draw.dart';
import '../../shelf.dart';

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
