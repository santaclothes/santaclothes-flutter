import 'package:santaclothes/data/remote/model/my_page_response.dart';
import 'package:santaclothes/data/remote/network/api_provider.dart';

class MyPageRepository {
  Future<MyPageResponse> getMyPageData() =>
      ApiProvider.instance.getMyPageData();
}
