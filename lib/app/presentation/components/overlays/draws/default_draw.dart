import 'package:flutter/material.dart';

import 'widgets/indicator_header.dart';

class CustomDraws {
  static showHelpDraw(
      {required BuildContext context,
        required List<Widget> body}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.red[400],
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          const IndicatorDrawHeader(),
          const SizedBox(
            height: 16,
          ),
          ...body,
          const SizedBox(
            height: 24,
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      // isScrollControlled: true
    );
  }
}
