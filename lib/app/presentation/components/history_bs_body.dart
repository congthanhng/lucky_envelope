import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/presentation/blocs/draw/draw_bloc.dart';
import 'package:lucky_envolope/app/presentation/components/overlays/dialogs/default_dialog.dart';
import 'package:lucky_envolope/shared/shelf.dart';

class HistoryBSBody extends StatefulWidget {
  const HistoryBSBody({Key? key}) : super(key: key);

  @override
  State<HistoryBSBody> createState() => _HistoryBSBodyState();
}

class _HistoryBSBodyState extends State<HistoryBSBody> {
  @override
  void initState() {
    context.read<DrawBloc>().add(DrawFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawBloc, DrawState>(
      builder: (context, state) {
        var result = [...state.data].reversed.toList();
        if (result.isEmpty) {
          return const Text(
            'Danh sách rút lì xì trống',
            style: TextStyle(color: Colors.white),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 1.5),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                  ),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Text(
                          result[index].peopleName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        const Spacer(),
                        Text(
                          result[index]
                              .envelope
                              .denominations
                              .toMoneyWithoutDecimal(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  itemCount: result.length,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: OutlinedButton(
                onPressed: () {
                  DefaultDialog.show(context,
                      body: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Bạn có muốn xoá lịch sử rút không?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'Lưu ý: Lịch sử rút sau khi xoá sẽ không thể khôi phục lại.',
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
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
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
                                      child: ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<DrawBloc>()
                                              .add(DrawDeleted());
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(0)),
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
                      ));

                  // Navigator.pop(context);
                },
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.white))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Xoá lịch sử',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
