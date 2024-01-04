import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/draw/draw_bloc.dart';
import '../../../components/overlays/draws/default_draw.dart';
import '../../../components/shelf.dart';

class HomeHistoryButton extends StatelessWidget {
  const HomeHistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawBloc, DrawState>(
      builder: (context, state) {
        if (state.data.isEmpty) return const SizedBox.shrink();
        return IconButton(
          tooltip: 'Lịch sử rút',
          onPressed: () {
            CustomDraws.showHistory(
                context: context, body: [const HistoryBSBody()]);
          },
          icon: const Icon(
            Icons.history,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
