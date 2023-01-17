import 'package:flutter/material.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';

class EnvelopeOpenedDialogBody extends StatelessWidget {
  const EnvelopeOpenedDialogBody({Key? key, required this.model})
      : super(key: key);

  final EnvelopeModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Chúc mừng',
            style: TextStyle(
                color: Colors.white, fontSize: 38, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Bạn rút được bao',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 24,
          ),
          Image.asset('assets/images/denominations/${model.name}.png'),
          const SizedBox(
            height: 24,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.white))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Đóng',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
