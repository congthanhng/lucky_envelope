import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/domain/models/envelope_model.dart';
import 'package:lucky_envolope/app/presentation/blocs/envelope_set/envelope_set_bloc.dart';

class EnvelopeSetInfoBSBody extends StatefulWidget {
  const EnvelopeSetInfoBSBody({Key? key}) : super(key: key);

  @override
  State<EnvelopeSetInfoBSBody> createState() => _EnvelopeSetInfoBSBodyState();
}

class _EnvelopeSetInfoBSBodyState extends State<EnvelopeSetInfoBSBody> {
  late final List<EnvelopeModel> openedData;
  late final List<EnvelopeModel> closedData;

  // final
  @override
  void initState() {
    closedData = context
        .read<EnvelopeSetBloc>()
        .state
        .data
        .notOpenedDenomination
        .values
        .toList();

    openedData = context
        .read<EnvelopeSetBloc>()
        .state
        .data
        .openedDenomination
        .values
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          closedData.isNotEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    'Các bao chưa mở:',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : const SizedBox.shrink(),
          closedData.isNotEmpty
              ? GridView.builder(
                  itemBuilder: (context, index) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${closedData[index].quantity}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      const Text(
                        ' x ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Image.asset(
                        'assets/images/denominations/${closedData[index].name}.png',
                        width: MediaQuery.of(context).size.width / 5,
                      )
                    ],
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: closedData.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              : const SizedBox.shrink(),
          openedData.isNotEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    'Các bao đã mở:',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : const SizedBox.shrink(),
          openedData.isNotEmpty
              ? GridView.builder(
                  itemBuilder: (context, index) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${openedData[index].quantity}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      const Text(
                        ' x ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Image.asset(
                        'assets/images/denominations/${openedData[index].name}.png',
                        width: MediaQuery.of(context).size.width / 5,
                      )
                    ],
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: openedData.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
