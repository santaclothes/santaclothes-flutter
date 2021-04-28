import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_flutter_sdk/user.dart';
import 'package:santaclothes/data/repository/auth_repository.dart';
import 'package:santaclothes/routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;

  AuthController(this._authRepository);

  logout() async {
    await UserApi.instance.logout();
    await AccessTokenStore.instance.clear();
    await _authRepository.deleteToken();
    Get.offAllNamed(Routes.LOGIN);
  }
}
