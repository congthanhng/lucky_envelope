import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/envelope_set/envelope_set_bloc.dart';
import 'package:lucky_envolope/app/presentation/pages/home/widgets/add_button.dart';
import 'package:lucky_envolope/app/presentation/pages/home/widgets/history_button.dart';

import '../../components/shelf.dart';
import '../shelf.dart';
import 'widgets/info_button.dart';
import 'widgets/reset_button.dart';
import 'widgets/setting_button.dart';
import 'widgets/shuffle_button.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

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
