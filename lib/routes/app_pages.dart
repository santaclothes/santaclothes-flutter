import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:santaclothes/presentation/dashboard/dashboard_binding.dart';
import 'package:santaclothes/presentation/dashboard/dashboard_screen.dart';
import 'package:santaclothes/presentation/login/login_binding.dart';
import 'package:santaclothes/presentation/login/login_screen.dart';
import 'package:santaclothes/presentation/onboarding/onboarding_binding.dart';
import 'package:santaclothes/presentation/onboarding/onboarding_screen.dart';
import 'package:santaclothes/presentation/splash/splash_binding.dart';
import 'package:santaclothes/presentation/splash/splash_screen.dart';
import 'package:santaclothes/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
  ];
}
