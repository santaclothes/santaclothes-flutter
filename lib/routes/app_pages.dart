import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:santaclothes/presentation/analysis_request/analysis_request_binding.dart';
import 'package:santaclothes/presentation/analysis_request/analysis_request_screen.dart';
import 'package:santaclothes/presentation/analysis_results%20/analysis_results_binding.dart';
import 'package:santaclothes/presentation/analysis_results%20/analysis_results_screen.dart';
import 'package:santaclothes/presentation/camera/camera_result/camera_result_binding.dart';
import 'package:santaclothes/presentation/camera/camera_result/camera_result_controller.dart';
import 'package:santaclothes/presentation/camera/camera_result/camera_result_screen.dart';
import 'package:santaclothes/presentation/camera/clothes_camera/clothes_camera_binding.dart';
import 'package:santaclothes/presentation/camera/clothes_camera/clothes_camera_screen.dart';
import 'package:santaclothes/presentation/camera/label_camera/label_camera_binding.dart';
import 'package:santaclothes/presentation/camera/label_camera/label_camera_screen.dart';
import 'package:santaclothes/presentation/dashboard/dashboard_binding.dart';
import 'package:santaclothes/presentation/dashboard/dashboard_screen.dart';
import 'package:santaclothes/presentation/login/login_binding.dart';
import 'package:santaclothes/presentation/login/login_screen.dart';
import 'package:santaclothes/presentation/onboarding/onboarding_binding.dart';
import 'package:santaclothes/presentation/onboarding/onboarding_screen.dart';
import 'package:santaclothes/presentation/result/result_screen.dart';
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
    GetPage(
      name: Routes.RESULT,
      page: () => ResultScreen(),
    ),
    GetPage(
      name: Routes.CLOTHES_CAMERA,
      page: () => ClothesCameraScreen(),
      binding: ClothesCameraBinding(),
    ),
    GetPage(
      name: Routes.LABEL_CAMERA,
      page: () => LabelCameraScreen(),
      binding: LabelCameraBinding(),
    ),
    GetPage(
      name: Routes.CLOTHES_CAMERA_RESULT,
      page: () => CameraResultScreen(tag: CLOTHES_RESULT_TAG),
      binding: CameraResultBinding(CLOTHES_RESULT_TAG),
    ),
    GetPage(
      name: Routes.LABEL_CAMERA_RESULT,
      page: () => CameraResultScreen(tag: LABEL_RESULT_TAG),
      binding: CameraResultBinding(LABEL_RESULT_TAG),
    ),
    GetPage(
      name: Routes.ANALYSIS_REQUEST,
      page: () => AnalysisRequestScreen(),
      binding: AnalysisRequestBinding(),
    ),
    GetPage(
      name: Routes.ANALYSIS_RESULTS,
      page: () => AnalysisResultsScreen(),
      binding: AnalysisResultsBinding(),
    ),
  ];
}
