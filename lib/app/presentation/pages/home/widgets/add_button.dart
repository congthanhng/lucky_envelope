import 'package:flutter/material.dart';

import '../../../components/overlays/draws/default_draw.dart';
import '../../../components/shelf.dart';

class HomeAddButton extends StatelessWidget {
  const HomeAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Row(
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            'Thêm bao',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      onPressed: () {
        CustomDraws.addNewEnvelope(
            context: context, body: const AddEnvelopeBSBody());
      },
    );
  }
}
