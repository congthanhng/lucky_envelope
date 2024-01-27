import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/envelope_set/envelope_set_bloc.dart';
import '../../../components/shelf.dart';
import 'reset_dialog.dart';

class HomeResetButton extends StatelessWidget {
  const HomeResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnvelopeSetBloc, EnvelopeSetState>(
      builder: (context, state) {
        var isShowReset = state.data.envelopes
            .where(
              (element) => element.isWithdraw == true,
            )
            .isNotEmpty;

        if (!isShowReset) return const SizedBox.shrink();
        return IconButton(
          tooltip: 'Thiết lập lại ban đầu',
          onPressed: () {
            DefaultDialog.show(context, body: const ResetDialog());
          },
          icon: const Icon(
            Icons.restart_alt_rounded,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
