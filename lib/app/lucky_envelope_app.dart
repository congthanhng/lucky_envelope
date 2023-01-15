import 'dart:math';

import 'package:flutter/material.dart';

final _rand = Random();

class LuckyEnvelopeApp extends StatefulWidget {
  const LuckyEnvelopeApp({Key? key}) : super(key: key);

  @override
  State<LuckyEnvelopeApp> createState() => _LuckyEnvelopeAppState();
}

class _LuckyEnvelopeAppState extends State<LuckyEnvelopeApp> {
  @override
  void initState() {
    super.initState();
  }

  int? itemSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: SafeArea(
          child: LayoutBuilder(
        builder: (context, constrain) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.7,
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16),
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                  borderRadius: BorderRadius.circular(4)),
              // clipBehavior: Clip.hardEdge,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      'assets/images/envolopes/envolope${_rand.nextInt(12) + 1}.png',
                      width: (constrain.maxWidth / 4) - 16,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: 12,
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red[400],
        selectedItemColor: Colors.yellow[300],
        unselectedItemColor: Colors.yellow[800],
        currentIndex: 0,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(label: 'Lì xì', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Cài đặt', icon: Icon(Icons.settings)),
          BottomNavigationBarItem(label: 'Lịch sử', icon: Icon(Icons.history)),
        ],
      ),
    );
  }
}
