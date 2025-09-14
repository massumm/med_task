import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services/api_service.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  final storage = GetStorage();

  var email = ''.obs;
  var password = ''.obs;

  Future<void> login() async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "requiredFields".tr);
      return;
    }

    final response = await ApiService.login(email.value, password.value);



    if (response['token'] != null) {
      storage.write('token', response['token']);
      isLoggedIn.value = true;
      Get.offAllNamed('/home');
    } else {
      Get.snackbar("Error", "Login failed");
    }
  }

  void checkLogin() {
    String? token = storage.read('token');
    if (token != null) {
      isLoggedIn.value = true;
      Get.offAllNamed('/home');
    }
  }

  void logout() {
    storage.remove('token');
    isLoggedIn.value = false;
    Get.offAllNamed('/login');
  }
}
