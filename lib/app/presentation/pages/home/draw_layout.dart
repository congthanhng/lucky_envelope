import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/domain/models/envelope/envelope_model.dart';
import 'package:lucky_envolope/app/presentation/blocs/envelope_set/envelope_set_bloc.dart';
import 'package:lucky_envolope/app/presentation/components/overlays/dialogs/default_dialog.dart';
import 'package:lucky_envolope/shared/shelf.dart';

import '../../components/envelope_opened_dialog_body.dart';

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
    var isTablet = DeviceInfo.isTablet;
    return LayoutBuilder(
      builder: (context, constrain) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.6,
            crossAxisCount: isTablet
                ? 6
                : widget.envelopes.length <= 6
                    ? 2
                    : widget.envelopes.length <= 12
                        ? 3
                        : 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8),
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (widget.envelopes[index].isWithdraw) return;
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
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Opacity(
                      opacity: preOpenIndex == index ? 0.5 : 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          imagePaths[index],
                          width: (constrain.maxWidth / 4) - 16,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  preOpenIndex == index
                      ? GestureDetector(
                          onTap: () {
                            context
                                .read<EnvelopeSetBloc>()
                                .add(EnvelopeSetWithdrawed(index));
                            setState(() {
                              preOpenIndex = -1;
                              widget.envelopes[index].isWithdraw = true;
                            });
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
                                padding: EdgeInsets.all(isTablet
                                    ? 32
                                    : widget.envelopes.length <= 6
                                        ? 28
                                        : widget.envelopes.length <= 12
                                            ? 20
                                            : 16),
                                child: const Text(
                                  'Mở',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  widget.envelopes[index].isWithdraw
                      ? Opacity(
                          opacity: 0.8,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: EdgeInsets.all(isTablet
                                      ? 32
                                      : widget.envelopes.length <= 6
                                          ? 28
                                          : widget.envelopes.length <= 12
                                              ? 20
                                              : 16),
                                  child: const Text(
                                    'Đã rút',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
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
