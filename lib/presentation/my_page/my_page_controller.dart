import 'package:get/get.dart';
import 'package:santaclothes/data/model/my_page_response.dart';
import 'package:santaclothes/data/repository/my_page_repository.dart';

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
    MyPageResponse? myPageData = await _myPageRepository.getMyPageData();

    if (myPageData != null) {
      myClothesCount.value = myPageData.myClothesCount;
      myPageClothes.value = myPageData.myPageClothes;
      userName.value = myPageData.userName;
    }
  }
}
