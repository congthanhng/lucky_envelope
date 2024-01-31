import 'package:lucky_envolope/app/presentation/shelf.dart';

class UILoading extends StatelessWidget {
  const UILoading({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xFFFFD700).withOpacity(.5)),
        child: XCircularLoading(
          child: Assets.icon.icLoading.image(),
        ),
      ),
    );
  }
}
