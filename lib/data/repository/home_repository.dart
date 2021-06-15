import 'package:santaclothes/data/model/home_response.dart';
import 'package:santaclothes/data/network/home_provider.dart';

class HomeRepository{
  Future<HomeResponse?> getUserData() => HomeProvider.instance.getUserData();
}