import 'package:flutter/material.dart';

import 'widgets/indicator_header.dart';

class CustomDraws {
  static showHelpDraw({required BuildContext context,
    required List<Widget> body}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.red[400],
      builder: (context) =>
          Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: Text('Đóng',
                    style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
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
