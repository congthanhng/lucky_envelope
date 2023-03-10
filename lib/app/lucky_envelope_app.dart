import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/draw/draw_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/envelope_set/envelope_set_bloc.dart';
import 'package:lucky_envolope/app/presentation/components/overlays/dialogs/default_dialog.dart';
import 'package:lucky_envolope/app/presentation/widgets/add_envelope_bs_body.dart';
import 'package:lucky_envolope/app/presentation/widgets/envelope_set_info_bs_body.dart';
import 'package:lucky_envolope/app/presentation/widgets/history_bs_body.dart';
import 'package:lucky_envolope/app/presentation/widgets/widgets.dart';

import 'presentation/components/overlays/draws/default_draw.dart';
import 'presentation/pages/pages.dart';

class LuckyEnvelopeApp extends StatefulWidget {
  const LuckyEnvelopeApp({Key? key}) : super(key: key);

  @override
  State<LuckyEnvelopeApp> createState() => _LuckyEnvelopeAppState();
}

class _LuckyEnvelopeAppState extends State<LuckyEnvelopeApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int? itemSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              BlocBuilder<EnvelopeSetBloc, EnvelopeSetState>(
                builder: (context, state) {
                  var isShowReset = state.data.envelopes
                      .where(
                        (element) => element.isWithdraw == true,
                      )
                      .isNotEmpty;
                  return isShowReset
                      ? Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: OutlinedButton(
                            onPressed: () {
                              DefaultDialog.show(context,
                                  body: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const Text(
                                              'B???n c?? mu???n thi???t l???p l???i b??? r??t l?? x???',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            const Text(
                                              'L??u ??: T???t c??? c??c bao l?? x?? ???? r??t s??? ???????c kh??i ph???c l???i tr???ng th??i ch??a r??t.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Hu???',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 16,
                                                ),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              EnvelopeSetBloc>()
                                                          .add(
                                                              EnvelopeSetReset());
                                                      Navigator.pop(context);
                                                    },
                                                    style: ButtonStyle(
                                                        elevation:
                                                            MaterialStateProperty
                                                                .all(0)),
                                                    child: const Text(
                                                      'C??',
                                                      style: TextStyle(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                            child: const Text(
                              'Thi???t l???p l???i',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : Container();
                },
              ),
              Tooltip(
                message: 'Th??m bao l?? x??',
                child: InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () {
                    CustomDraws.addNewEnvelope(
                        context: context, body: const AddEnvelopeBSBody());
                  },
                  child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
              ),
              const Spacer(),
              BlocBuilder<EnvelopeSetBloc, EnvelopeSetState>(
                builder: (context, state) {
                  if (state.data.envelopes.isEmpty == true) {
                    return const SizedBox.shrink();
                  }
                  return Tooltip(
                    message: 'Th??ng tin',
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: () {
                        CustomDraws.showInfo(
                            context: context,
                            body: [const EnvelopeSetInfoBSBody()]);
                      },
                      child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          )),
                    ),
                  );
                },
              ),
              BlocBuilder<DrawBloc, DrawState>(
                builder: (context, state) {
                  if (state.data.isEmpty) return const SizedBox.shrink();
                  return Tooltip(
                    message: 'L???ch s???',
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: () {
                        CustomDraws.showHistory(
                            context: context, body: [const HistoryBSBody()]);
                      },
                      child: const Padding(
                          padding: EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                            left: 16,
                          ),
                          child: Icon(
                            Icons.history,
                            color: Colors.white,
                          )),
                    ),
                  );
                },
              ),
              Tooltip(
                message: 'C??i ?????t b??? l?? x??',
                child: InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () {
                    CustomDraws.showHelpDraw(context: context, body: [
                      SettingPage(
                        onCreated: () {
                          Navigator.pop(context);
                        },
                      )
                    ]);
                  },
                  child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Container(
          //     height: 1,
          //     width: double.infinity,
          //     color: Colors.black12,
          //   ),
          // ),
          Expanded(
            child: BlocBuilder<EnvelopeSetBloc, EnvelopeSetState>(
              buildWhen: (previous, current) =>
                  current.runtimeType != EnvelopeSetWithdrawSuccess,
              builder: (context, state) {
                if (state.data.envelopes.isEmpty == true) {
                  return const SettingPage();
                }
                return DrawEnvelopeLayout(
                  key: UniqueKey(),
                  envelopes: state.data.envelopes,
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
