import 'package:flutter/material.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';

class EnvelopeOpenedDialogBody extends StatefulWidget {
  const EnvelopeOpenedDialogBody({Key? key, required this.model})
      : super(key: key);

  final EnvelopeModel model;

  @override
  State<EnvelopeOpenedDialogBody> createState() => _EnvelopeOpenedDialogBodyState();
}

class _EnvelopeOpenedDialogBodyState extends State<EnvelopeOpenedDialogBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Padding(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 100,
                  child: TextField(
                    cursorColor: Colors.white,
                    cursorHeight: 20,
                    autofocus: true,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    // textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      hintText: 'Nhập tên...',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      focusColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white, fontSize: 24),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                SizedBox(width: 4,),
                Text(
                  'rút được bao',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Image.asset('assets/images/denominations/${widget.model.name}.png'),
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
      ),
    );
  }
}
