import 'package:get/get.dart';

import '../../model/user/user.dart';
import '../../services/auth/auth_service.dart';


class LoginController extends GetxController {
  final AuthService _authService = AuthService();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final UserModel user = await _authService.login(username, password);
      isLoading.value = false;

      // 로그인 성공 시 다른 화면으로 이동
      Get.snackbar("Login Success", "Welcome ${user.username}");
      Get.offNamed('/home');
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
      Get.snackbar("Login Failed", errorMessage.value);
    }
  }
}
