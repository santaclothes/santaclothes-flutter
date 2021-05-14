import 'package:get/get.dart';
import 'package:santaclothes/presentation/dashboard/dashboard_controller.dart';
import 'package:santaclothes/presentation/home/home_controller.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MyPageController>(() => MyPageController());
  }
}
