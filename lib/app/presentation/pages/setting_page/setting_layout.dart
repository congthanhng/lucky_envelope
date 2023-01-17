import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/presentation/pages/setting_page/bloc/setting_bloc.dart';
import 'package:lucky_envolope/app/presentation/pages/setting_page/widgets/money_cell.dart';
import 'package:lucky_envolope/app/presentation/resources/values/constants.dart';
import 'package:lucky_envolope/app/utils/num_extension.dart';
import 'package:lucky_envolope/gen/assets.gen.dart';

class SettingLayout extends StatelessWidget {
  SettingLayout({Key? key}) : super(key: key);
  final List<MoneyCell> cells = [
    MoneyCell(
        name: Constants.vnd_500,
        assetsPath: Assets.images.money.money0.path,
        number: 500),
    MoneyCell(
        name: Constants.vnd_1k,
        assetsPath: Assets.images.money.money1.path,
        number: 1000),
    MoneyCell(
        name: Constants.vnd_2k,
        assetsPath: Assets.images.money.money2.path,
        number: 2000),
    MoneyCell(
        name: Constants.vnd_5k,
        assetsPath: Assets.images.money.money3.path,
        number: 5000),
    MoneyCell(
        name: Constants.vnd_10k,
        assetsPath: Assets.images.money.money4.path,
        number: 10000),
    MoneyCell(
        name: Constants.vnd_20k,
        assetsPath: Assets.images.money.money5.path,
        number: 20000),
    MoneyCell(
        name: Constants.vnd_50k,
        assetsPath: Assets.images.money.money6.path,
        number: 50000),
    MoneyCell(
        name: Constants.vnd_100k,
        assetsPath: Assets.images.money.money7.path,
        number: 100000),
    MoneyCell(
        name: Constants.vnd_200k,
        assetsPath: Assets.images.money.money8.path,
        number: 200000),
    MoneyCell(
        name: Constants.vnd_500k,
        assetsPath: Assets.images.money.money9.path,
        number: 500000),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow)),
              padding: const EdgeInsets.only(top: 16),
              child: GridView.count(
                crossAxisCount: 2,
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
                    left: BorderSide(color: Colors.yellow)
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Center(
                      child: Text(
                        'Tổng cộng ',
                        style: TextStyle(fontSize: 18),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Center(
                      child: BlocBuilder<SettingBloc, SettingState>(
                        builder: (context, state) {
                          var total = state.envelopesData.values.fold(0, (previousValue, element) => previousValue + element.total,);
                          return Text(
                            total.toMoneyWithoutDecimal(),
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          );
                        },
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Tạo'),
            )
          ],
        ),
      ),
    );
  }
}
