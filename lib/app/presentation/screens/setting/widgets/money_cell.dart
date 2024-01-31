import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/shared/shelf.dart';

import '../bloc/setting_bloc.dart';

class MoneyCell extends StatefulWidget {
  const MoneyCell(
      {Key? key,
      required this.assetsPath,
      required this.name,
      required this.number})
      : super(key: key);

  final String assetsPath;
  final String name;
  final int number;

  @override
  State<MoneyCell> createState() => _MoneyCellState();
}

class _MoneyCellState extends State<MoneyCell> {

  @override
  void initState() {
    super.initState();
  }

  void _onQuantityChanged(BuildContext context, int quantity) {
    context.read<SettingBloc>().add(SettingEnvelopeQuantityChanged(
        quantity: quantity, envelopeName: widget.name));
  }

  @override
  Widget build(BuildContext context) {
    var isTablet = DeviceInfo.isTablet;
    return Column(
      children: [
        Image.asset(
          widget.assetsPath,
          width: MediaQuery.of(context).size.width / (isTablet ? 6 : 3.7),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                var model = context
                    .read<SettingBloc>()
                    .state
                    .envelopesData[widget.name];
                if ((model?.quantity ?? 0) <= 0) {
                  if ((model?.quantity ?? 0) != 0) {
                    _onQuantityChanged(context, 0);
                  }
                } else {
                  _onQuantityChanged(context, (model?.quantity ?? 0) - 1);
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.remove, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BlocBuilder<SettingBloc, SettingState>(
                builder: (context, state) {
                  var quantity =
                      state.envelopesData[widget.name]?.quantity ?? 0;
                  return Text(
                    '$quantity',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                var model = context
                    .read<SettingBloc>()
                    .state
                    .envelopesData[widget.name];
                _onQuantityChanged(context, (model?.quantity ?? 0) + 1);
              },
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
