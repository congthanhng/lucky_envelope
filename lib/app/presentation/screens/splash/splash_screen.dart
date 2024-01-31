import '../../shelf.dart';
import 'splash_view.dart';

//TODO: build baseScreen
class SplashScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashView());
  }
}
