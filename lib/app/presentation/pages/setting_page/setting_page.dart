import 'package:flutter/material.dart';
import 'package:lucky_envolope/app/presentation/pages/setting_page/widgets/money_cell.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final List<MoneyCell> cells = [
    const MoneyCell(
        name: '500đ',
        assetsPath: 'assets/images/money/money0.png',
        number: 500),
    const MoneyCell(
        name: '1.000đ',
        assetsPath: 'assets/images/money/money1.png',
        number: 1000),
    const MoneyCell(
        name: '2.000đ',
        assetsPath: 'assets/images/money/money2.png',
        number: 2000),
    const MoneyCell(
        name: '5.000đ',
        assetsPath: 'assets/images/money/money3.png',
        number: 5000),
    const MoneyCell(
        name: '10.000đ',
        assetsPath: 'assets/images/money/money4.png',
        number: 10000),
    const MoneyCell(
        name: '20.000đ',
        assetsPath: 'assets/images/money/money5.png',
        number: 20000),
    const MoneyCell(
        name: '50.000đ',
        assetsPath: 'assets/images/money/money6.png',
        number: 50000),
    const MoneyCell(
        name: '100.000đ',
        assetsPath: 'assets/images/money/money7.png',
        number: 100000),
    const MoneyCell(
        name: '200.000đ',
        assetsPath: 'assets/images/money/money8.png',
        number: 200000),
    const MoneyCell(
        name: '500.000đ',
        assetsPath: 'assets/images/money/money9.png',
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
              decoration: BoxDecoration(border: Border.all(color: Colors.yellow)),
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
                children: const [
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                      child: Text(
                        'Tổng cộng ',
                        style: TextStyle(fontSize: 18),
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                      child: Text(
                        '2.000.000đ',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
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
