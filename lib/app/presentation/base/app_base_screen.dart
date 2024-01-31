import 'package:lucky_envolope/app/presentation/shelf.dart';
import 'package:lucky_envolope/shared/screen/base_screen.dart';

abstract base class AppBaseScreen extends BaseScreen {
  const AppBaseScreen({super.key});

  @override
  Widget loadingBuilder(BuildContext context) {
    return const UILoading();
  }
}
