import 'package:lucky_envolope/app/presentation/shelf.dart';

class UILoading extends StatelessWidget {
  const UILoading({super.key});

  @override
  Widget build(BuildContext context) {
    return XCircularLoading(
      child: Assets.icon.icLoading.image(),
    );
  }
}
