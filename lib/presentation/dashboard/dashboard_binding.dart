import 'package:get/get.dart';
import 'package:santaclothes/data/repository/home_repository.dart';
import 'package:santaclothes/data/repository/my_page_repository.dart';
import 'package:santaclothes/presentation/dashboard/dashboard_controller.dart';
import 'package:santaclothes/presentation/home/home_controller.dart';
import 'package:santaclothes/presentation/my_page/my_page_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController(HomeRepository()));
    Get.lazyPut<MyPageController>(() => MyPageController(MyPageRepository()));
  }
}
