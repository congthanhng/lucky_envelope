import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lucky_envolope/app/models/envelope_model.dart';

final _rand = Random();

class DrawEnvelopeLayout extends StatelessWidget {
  const DrawEnvelopeLayout({Key? key, required this.envelopes}) : super(key: key);

  final List<EnvelopeModel> envelopes;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16),
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow),
                borderRadius: BorderRadius.circular(4)),
            // clipBehavior: Clip.hardEdge,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/images/envolopes/envolope${_rand.nextInt(12) + 1}.png',
                    width: (constrain.maxWidth / 4) - 16,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 12,
      ),
    );
  }
}
