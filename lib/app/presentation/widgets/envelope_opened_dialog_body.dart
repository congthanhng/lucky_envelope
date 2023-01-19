import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';
import 'package:lucky_envolope/app/domain/models/history/history_model.dart';
import 'package:lucky_envolope/app/presentation/blocs/draw/draw_bloc.dart';

class EnvelopeOpenedDialogBody extends StatefulWidget {
  const EnvelopeOpenedDialogBody({Key? key, required this.model})
      : super(key: key);

  final EnvelopeModel model;

  @override
  State<EnvelopeOpenedDialogBody> createState() =>
      _EnvelopeOpenedDialogBodyState();
}

class _EnvelopeOpenedDialogBodyState extends State<EnvelopeOpenedDialogBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Chúc mừng',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: _controller,
                        cursorColor: Colors.white,
                        cursorHeight: 20,
                        autofocus: true,
                        style: const TextStyle(color: Colors.white, fontSize: 24),
                        // textAlign: TextAlign.end,
                        decoration: const InputDecoration(
                          hintText: 'Nhập tên...',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                          focusColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white, fontSize: 24),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      'rút được bao',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset('assets/images/denominations/${widget.model.name}.png'),
                ),
                const SizedBox(
                  height: 24,
                ),
                OutlinedButton(
                  onPressed: () {
                    context.read<DrawBloc>().add(DrawSaved(HistoryModel(
                        envelope: widget.model,
                        peopleName: _controller.text,
                        dateTime: DateTime.now().toString())));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.white))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Lưu & Đóng',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
