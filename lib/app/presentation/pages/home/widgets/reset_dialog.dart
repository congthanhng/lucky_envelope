import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/envelope_set/envelope_set_bloc.dart';

class ResetDialog extends StatelessWidget {
  const ResetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        width: MediaQuery.of(context).size.width / 1.5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Bạn có muốn thiết lập lại bộ rút lì xì?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Lưu ý: Tất cả các bao lì xì đã rút sẽ được khôi phục lại trạng thái chưa rút.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style:
                          ButtonStyle(elevation: MaterialStateProperty.all(0)),
                      child: const Text(
                        'Huỷ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.read<EnvelopeSetBloc>().add(EnvelopeSetReset());
                        Navigator.pop(context);
                      },
                      style:
                          ButtonStyle(elevation: MaterialStateProperty.all(0)),
                      child: const Text(
                        'Có',
                        style: TextStyle(),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
