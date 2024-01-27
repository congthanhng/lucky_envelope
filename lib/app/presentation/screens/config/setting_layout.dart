import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/envelope_set/envelope_set_bloc.dart';
import 'package:lucky_envolope/gen/assets.gen.dart';
import 'package:lucky_envolope/shared/shelf.dart';

import '../../../resources/values/constants.dart';
import 'bloc/setting_bloc.dart';
import 'widgets/money_cell.dart';



class SettingLayout extends StatefulWidget {
  const SettingLayout({Key? key, this.onCreated}) : super(key: key);
  final VoidCallback? onCreated;

  @override
  State<SettingLayout> createState() => _SettingLayoutState();
}

class _SettingLayoutState extends State<SettingLayout> {
  final List<MoneyCell> cells = [
    MoneyCell(
        name: Constants.vnd_500,
        assetsPath: Assets.images.denominations.vnd500.path,
        number: 500),
    MoneyCell(
        name: Constants.vnd_1k,
        assetsPath: Assets.images.denominations.vnd1k.path,
        number: 1000),
    MoneyCell(
        name: Constants.vnd_2k,
        assetsPath: Assets.images.denominations.vnd2k.path,
        number: 2000),
    MoneyCell(
        name: Constants.vnd_5k,
        assetsPath: Assets.images.denominations.vnd5k.path,
        number: 5000),
    MoneyCell(
        name: Constants.vnd_10k,
        assetsPath: Assets.images.denominations.vnd10k.path,
        number: 10000),
    MoneyCell(
        name: Constants.vnd_20k,
        assetsPath: Assets.images.denominations.vnd20k.path,
        number: 20000),
    MoneyCell(
        name: Constants.vnd_50k,
        assetsPath: Assets.images.denominations.vnd50k.path,
        number: 50000),
    MoneyCell(
        name: Constants.vnd_100k,
        assetsPath: Assets.images.denominations.vnd100k.path,
        number: 100000),
    MoneyCell(
        name: Constants.vnd_200k,
        assetsPath: Assets.images.denominations.vnd200k.path,
        number: 200000),
    MoneyCell(
        name: Constants.vnd_500k,
        assetsPath: Assets.images.denominations.vnd500k.path,
        number: 500000),
  ];

  @override
  void initState() {
    context.read<SettingBloc>().add(SettingFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isTablet = DeviceInfo.isTablet;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.yellow)),
              padding: const EdgeInsets.only(top: 16),
              child: GridView.count(
                crossAxisCount: isTablet ? 4 : 2,
                childAspectRatio: 2,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: cells,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.transparent),
                    bottom: BorderSide(color: Colors.yellow),
                    right: BorderSide(color: Colors.yellow),
                    left: BorderSide(color: Colors.yellow)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Tổng cộng:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Center(child: BlocBuilder<SettingBloc, SettingState>(
                      builder: (context, state) {
                        var total = state.envelopesData.values.fold(
                          0,
                          (previousValue, element) =>
                              previousValue + element.total,
                        );
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              total.toMoneyWithoutDecimal(),
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<SettingBloc>().add(SettingReset());
                              },
                              icon: const Icon(
                                Icons.restart_alt_rounded,
                                color: Colors.white,
                              ),
                              tooltip: 'Thiết lập về 0',
                            )
                          ],
                        );
                      },
                    )),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
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
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.white))),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Huỷ bỏ',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      var model =
                          context.read<SettingBloc>().state.envelopesData;
                      context.read<SettingBloc>().add(SettingSaved());
                      context
                          .read<EnvelopeSetBloc>()
                          .add(EnvelopeSetGenerated(model));
                      widget.onCreated?.call();
                    },
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.amber)),
                    child: const Text(
                      'Áp dụng',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
