import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/envelope_set/envelope_set_bloc.dart';
import 'package:lucky_envolope/app/presentation/widgets/widgets.dart';

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

  int? itemSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: SafeArea(child: BlocBuilder<EnvelopeSetBloc, EnvelopeSetState>(
        builder: (context, state) {
          if (state.data.envelopes.isEmpty == true) {
            return const SettingPage();
          }
          return DrawEnvelopeLayout(
            envelopes: state.data.envelopes,
          );
        },
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red[400],
        selectedItemColor: Colors.yellow[300],
        unselectedItemColor: Colors.yellow[800],
        currentIndex: 0,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(label: 'Lì xì', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Thiết lập', icon: Icon(Icons.settings)),
          BottomNavigationBarItem(label: 'Lịch sử', icon: Icon(Icons.history)),
        ],
      ),
    );
  }
}
