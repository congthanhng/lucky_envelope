import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/envelope_set/envelope_set_bloc.dart';
import '../config/setting_page.dart';
import 'components/add_button.dart';
import 'components/history_button.dart';
import 'components/info_button.dart';
import 'components/reset_button.dart';
import 'components/setting_button.dart';
import 'components/shuffle_button.dart';
import 'draw_layout.dart';

class WithdrawLayout extends StatelessWidget {
  const WithdrawLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        Expanded(child: _buildContent(context)),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) => const Row(
        children: [
          HomeAddButton(),
          HomeResetButton(),
          HomeShuffleButton(),
          Spacer(),
          HomeInfoButton(),
          HomeHistoryButton(),
          HomeSettingButton()
        ],
      );

  Widget _buildContent(BuildContext context) =>
      BlocBuilder<EnvelopeSetBloc, EnvelopeSetState>(
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
      );
}
