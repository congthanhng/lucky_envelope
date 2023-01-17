import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';
import 'package:lucky_envolope/app/presentation/components/overlays/dialogs/default_dialog.dart';
import 'package:lucky_envolope/app/presentation/widgets/envelope_opened_dialog_body.dart';

final _rand = Random();

class DrawEnvelopeLayout extends StatefulWidget {
  const DrawEnvelopeLayout({Key? key, required this.envelopes})
      : super(key: key);

  final List<EnvelopeModel> envelopes;

  @override
  State<DrawEnvelopeLayout> createState() => _DrawEnvelopeLayoutState();
}

class _DrawEnvelopeLayoutState extends State<DrawEnvelopeLayout> {
  int preOpenIndex = -1;

  final List<String> imagePaths = [];

  @override
  void initState() {
    for (var element in widget.envelopes) {
      imagePaths
          .add('assets/images/envolopes/envolope${_rand.nextInt(12) + 1}.png');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisCount: widget.envelopes.length <= 6
                ? 2
                : widget.envelopes.length <= 12
                    ? 3
                    : 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16),
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (preOpenIndex == index) {
                  preOpenIndex = -1;
                } else {
                  preOpenIndex = index;
                }
              });
            },
            child: Container(
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
                      imagePaths[index],
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
                  ),
                  preOpenIndex == index
                      ? GestureDetector(
                          onTap: () {
                            DefaultDialog.show(context,
                                body: EnvelopeOpenedDialogBody(
                                  model: widget.envelopes[index],
                                ));
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.yellow[700]),
                              child: Padding(
                                padding:
                                    EdgeInsets.all(widget.envelopes.length <= 6
                                        ? 28
                                        : widget.envelopes.length <= 12
                                            ? 20
                                            : 16),
                                child: const Text(
                                  'Mở',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          );
        },
        itemCount: widget.envelopes.length,
      ),
    );
  }
}
