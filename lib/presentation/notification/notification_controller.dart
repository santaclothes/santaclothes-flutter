import 'package:get/get.dart';

class NotificationController extends GetxController {
  int currentPage = 0;

  Future<List<String>> getTextItems() async {
    // await Future.delayed(Duration(seconds: 1));
    return ["1", "2", "3", "4", "5", "7", "8", "9", "10"];
  }
}
