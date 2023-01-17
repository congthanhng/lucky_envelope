import 'package:flutter/material.dart';

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
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          widget.assetsPath,
          width: MediaQuery.of(context).size.width / 3.5,
        ),
        // SizedBox(width: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (_quantity <= 0) {
                  setState(() {
                    _quantity = 0;
                  });
                } else {
                  setState(() {
                    _quantity--;
                  });
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.remove, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '$_quantity',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _quantity++;
                });
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
