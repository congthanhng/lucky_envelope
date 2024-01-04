import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/envelope_set/envelope_set_bloc.dart';
import '../../../components/overlays/draws/default_draw.dart';
import '../../../components/shelf.dart';

class HomeInfoButton extends StatelessWidget {
  const HomeInfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnvelopeSetBloc, EnvelopeSetState>(
      builder: (context, state) {
        if (state.data.envelopes.isEmpty == true) {
          return const SizedBox.shrink();
        }
        return IconButton(
          tooltip: 'Tình trạng các bao',
          onPressed: () {
            CustomDraws.showInfo(
                context: context, body: [const EnvelopeSetInfoBSBody()]);
          },
          icon: const Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
