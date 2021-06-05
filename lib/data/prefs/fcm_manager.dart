import 'package:santaclothes/data/model/fcm_data.dart';
import 'package:santaclothes/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FcmManager {
  static final FcmManager _onboardingGuideManager =
  new FcmManager._internal();

  static FcmManager get instance => _onboardingGuideManager;

  FcmManager._internal();

  Future<void> setCategory(FcmData data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(FCM_DATA_CATEGORY, data.category);
    await prefs.setInt(FCM_DATA_ID, data.id);
  }

  Future<FcmData> getCategory() async {
    FcmData result = FcmData("none",0);

    final prefs = await SharedPreferences.getInstance();
    String? category = prefs.getString(FCM_DATA_CATEGORY);
    int? id = prefs.getInt(FCM_DATA_ID);

    if(category != null && id != null){
      result = FcmData(category,id);
    }

    return result;
  }
}
