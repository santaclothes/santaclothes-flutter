import 'package:santaclothes/data/remote/model/home_response.dart';
import 'package:santaclothes/data/network/api_provider.dart';

class HomeRepository {
  Future<HomeResponse?> getHomeData() => ApiProvider.instance.getHomeData();
}
