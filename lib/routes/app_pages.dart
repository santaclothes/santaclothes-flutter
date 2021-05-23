import 'package:get/get_navigation/src/routes/get_route.dart';
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
      binding: CameraResultBinding(tag: CLOTHES_RESULT_TAG),
    ),
    GetPage(
      name: Routes.LABEL_CAMERA_RESULT,
      page: () => CameraResultScreen(tag: LABEL_RESULT_TAG),
      binding: CameraResultBinding(tag: LABEL_RESULT_TAG),
    ),
  ];
}
