class HomeProvider {
  static final HomeProvider _homeProvider = HomeProvider._internal();

  static HomeProvider get instance => _homeProvider;

  HomeProvider._internal();

}