import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_envolope/app/domain/models/denomination/denomination_vn.dart';
import 'package:lucky_envolope/app/domain/models/envelope/envelope_model.dart';
import 'package:lucky_envolope/app/presentation/blocs/envelope_set/envelope_set_bloc.dart';
import 'package:lucky_envolope/app/presentation/pages/setting_page/bloc/setting_bloc.dart';
import 'package:lucky_envolope/shared/shelf.dart';

class AddEnvelopeBSBody extends StatefulWidget {
  const AddEnvelopeBSBody({Key? key}) : super(key: key);

  @override
  State<AddEnvelopeBSBody> createState() => _AddEnvelopeBSBodyState();
}

class _AddEnvelopeBSBodyState extends State<AddEnvelopeBSBody> {
  final List<Widget> cells = DenominationVN.getDefault.values
      .toList()
      .map(
        (e) => Image.asset('assets/images/denominations/${e.name}.png',
            fit: BoxFit.fitWidth),
      )
      .toList();

  @override
  void initState() {
    super.initState();
  }

  int selectedIndex = 4;
  int quantity = 1;

  final SettingBloc _settingBloc = SettingBloc()..add(SettingFetched());

  @override
  Widget build(BuildContext context) {
    var isTablet = DeviceInfo.isTablet;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Chọn mệnh giá:',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2,
              crossAxisCount: isTablet ? 5 : 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (selectedIndex != index) {
                  setState(() {
                    selectedIndex = index;
                  });
                }
              },
              child: Container(
                decoration: selectedIndex == index
                    ? BoxDecoration(
                        border: Border.all(color: Colors.yellow, width: 3))
                    : null,
                child: cells[index],
              ),
            );
          },
          itemCount: cells.length,
        ),
        const SizedBox(
          height: 16,
        ),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Số lượng:',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (quantity < 1) {
                      setState(() {
                        quantity = 1;
                      });
                    } else if (quantity > 1) {
                      setState(() {
                        quantity--;
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
                    '$quantity',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      quantity++;
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
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Lưu ý: Sau khi nhấn thêm, toàn bộ lì xì chưa rút còn lại sẽ bị xáo trộn vị trí để đảm bảo tính ngẫu nhiên và công bằng.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () {
              var denomination =
                  DenominationVN.getDefault.values.toList()[selectedIndex];
              context.read<EnvelopeSetBloc>().add(EnvelopeSetItemAdded(
                  EnvelopeModel(
                      name: denomination.name,
                      quantity: quantity,
                      denominations: denomination.value,
                      isWithdraw: false)));
              _settingBloc
                  .add(SettingQuantityIncreased(denomination.name, quantity));
              Navigator.pop(context);
            },
            style: ButtonStyle(elevation: MaterialStateProperty.all(0)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Thêm',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
