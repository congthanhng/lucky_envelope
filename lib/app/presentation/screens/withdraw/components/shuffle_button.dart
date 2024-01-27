import 'package:flutter/material.dart';

class HomeShuffleButton extends StatelessWidget {
  const HomeShuffleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Xáo trộn',
      onPressed: () {
        // CustomDraws.showHelpDraw(context: context, body: [
        //   SettingPage(
        //     onCreated: () {
        //       Navigator.pop(context);
        //     },
        //   )
        // ]);
      },
      icon: const Icon(
        Icons.shuffle,
        color: Colors.white,
      ),
    );
  }
}
