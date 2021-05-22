import 'package:get/get.dart';

class ClothesCameraResultController extends GetxController {
  final imagePath = ''.obs;

  @override
  void onReady() {
    super.onReady();
    if ((Get.arguments as String).isNotEmpty) {
      imagePath.value = Get.arguments;
      update();
    } else {
      Get.back();
    }
  }
}
