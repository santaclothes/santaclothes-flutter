import 'package:santaclothes/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseMessagingManager {
  static final FirebaseMessagingManager _firebaseMessagingManager =
      new FirebaseMessagingManager._internal();

  static FirebaseMessagingManager get instance => _firebaseMessagingManager;

  FirebaseMessagingManager._internal();

  Future<bool> setFirebaseMessageData() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(PREF_FIREBASE_MESSAGE, true);
  }

  Future<bool?> existsFirebaseMessageData() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? data = prefs.getBool(PREF_FIREBASE_MESSAGE);
    if (data != null && data == true) {
      prefs.remove(PREF_FIREBASE_MESSAGE); // 한번 가져온 데이터는 삭제 처리
      return true;
    }
    return false;
  }
}
