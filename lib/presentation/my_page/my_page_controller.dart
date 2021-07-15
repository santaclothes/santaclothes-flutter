import 'package:get/get.dart';
import 'package:santaclothes/data/repository/my_page_repository.dart';
import 'package:santaclothes/utils/constants.dart';

class MyPageController extends GetxController {
  final MyPageRepository _myPageRepository;
  final myClothesCount = 0.obs;
  final userName = "".obs;
  final myPageClothes = [].obs;

  MyPageController(this._myPageRepository);

  @override
  Future<void> onReady() async {
    await fetchMyPageData();
  }

  fetchMyPageData() async {
    try {
      final result = await _myPageRepository.getMyPageData();
      myClothesCount.value = result.myClothesCount;
      myPageClothes.value = result.myPageClothes;
      userName.value = result.userName;
    } catch (e) {
      Get.snackbar("마이페이지 정보 가져오기 실패", DEFAULT_ERROR_MSG);
    }
  }
}
