import 'package:santaclothes/data/model/home_response.dart';
import 'package:santaclothes/data/network/api_provider.dart';

class HomeRepository{
  Future<HomeResponse?> getUserData() => ApiProvider.instance.getUserData();
}