import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:santaclothes/presentation/splash/splash_binding.dart';
import 'package:santaclothes/presentation/splash/splash_screen.dart';
import 'package:santaclothes/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    )
  ];
}
