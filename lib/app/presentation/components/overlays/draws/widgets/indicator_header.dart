import 'package:flutter/material.dart';

class IndicatorDrawHeader extends StatelessWidget {
  const IndicatorDrawHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4)
      ),
    );
  }
}
