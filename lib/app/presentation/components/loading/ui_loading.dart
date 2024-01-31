import 'package:lucky_envolope/app/presentation/shelf.dart';
import 'package:lucky_envolope/shared/ui_kit/resources/ui_colors.dart';

class UILoading extends StatelessWidget {
  const UILoading({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: UIColors.redEnvelope, width: 1),
            borderRadius: BorderRadius.circular(16),
            color: UIColors.gold.withOpacity(0.9)),
        child: XCircularLoading(
          child: Assets.icon.icLoading.image(),
        ),
      ),
    );
  }
}
