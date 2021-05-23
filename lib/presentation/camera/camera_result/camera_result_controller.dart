import 'package:get/get.dart';

const String CLOTHES_RESULT_TAG = "CLOTHES_RESULT_TAG";
const String LABEL_RESULT_TAG = "LABEL_RESULT_TAG";

class CameraResultController extends GetxController {
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
