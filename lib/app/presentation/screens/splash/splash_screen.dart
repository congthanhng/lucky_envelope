import 'package:lucky_envolope/app/presentation/base/app_base_screen.dart';

import '../../shelf.dart';
import 'splash_view.dart';

final class SplashScreen extends AppBaseScreen {
  static routeConfig({List<RouteBase>? routes}) => GoRoute(
      name: RouteNamed.splash.named,
      path: RouteNamed.splash.path,
      onExit: (context) {
        //TODO: implement confirm before exit
        return false;
      },
      redirect: (context, state) {},
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SplashScreen()),
      routes: routes ?? []);

  const SplashScreen({super.key});

  @override
  Widget viewBuilder(BuildContext context) => const SplashView();
}
