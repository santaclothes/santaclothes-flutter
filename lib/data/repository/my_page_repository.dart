import 'package:santaclothes/data/model/my_page_response.dart';
import 'package:santaclothes/data/network/api_provider.dart';

class MyPageRepository{
  Future<MyPageResponse?> getMyPageData() => ApiProvider.instance.getMyPageData();
}