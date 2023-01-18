import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/draw/draw_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/envelope_set/envelope_set_bloc.dart';
import 'package:lucky_envolope/app/presentation/components/overlays/dialogs/default_dialog.dart';
import 'package:lucky_envolope/app/presentation/widgets/add_envelope_bs_body.dart';
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
    context.read<EnvelopeSetBloc>().add(EnvelopeSetFetched());
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
          SizedBox(
            height: kToolbarHeight - 10,
            child: Row(
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              const Text(
                                                'Bạn có muốn thiết lập lại bộ rút lì xì?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 24),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              const Text(
                                                'Lưu ý: Tất cả các bao lì xì đã rút sẽ được khôi phục lại trạng thái chưa rút.',
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
                                                        'Huỷ',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
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
                                                        'Có',
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
                                'Thiết lập lại',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        : Container();
                  },
                ),
                Tooltip(
                  message: 'Thêm bao',
                  child: InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: () {
                      CustomDraws.addNewEnvelope(
                          context: context, body: [
                        const AddEnvelopeBSBody()
                      ]);
                    },
                    child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ),
                ),
                const Spacer(),
                BlocBuilder<DrawBloc, DrawState>(
                  builder: (context, state) {
                    if (state.data.isEmpty) return const SizedBox.shrink();
                    return Tooltip(
                      message: 'Lịch sử',
                      child: InkWell(
                        borderRadius: BorderRadius.circular(6),
                        onTap: () {
                          CustomDraws.showHistory(
                              context: context, body: [const HistoryBSBody()]);
                        },
                        child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Icon(
                              Icons.history,
                              color: Colors.white,
                            )),
                      ),
                    );
                  },
                ),
                Tooltip(
                  message: 'Cài đặt bộ lì xì',
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
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.black12,
            ),
          ),
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
