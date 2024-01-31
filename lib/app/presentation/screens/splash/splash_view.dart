import '../../shelf.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width / 3,
                child: Assets.icon.logoLogoUp.image())));
  }
}
