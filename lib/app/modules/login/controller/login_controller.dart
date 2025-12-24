import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_colors.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/helpers/auth_storage.dart';
import '../../../core/helpers/bio_matric_auth.dart';
import '../../../data/repositories/api_service.dart';
import '../../../routes/app_routes.dart';
import '../../bottom_bar/view/student_bottom_bar.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;
  var isVisible = false.obs;

  final ApiService _api = ApiService();
  final BiometricAuth _biometric = BiometricAuth();
  final ApiEndpoints _endpoints = ApiEndpoints();

  void isVisibleToggle() {
    isVisible.value = !isVisible.value;
  }

  void login() async {
    if(isLoading.value) return;
    isLoading.value = true;

    try {
      final body = {
        // "email": emailController.text.trim(),
        // "password": passwordController.text.trim(),
        "email": "admin1@gmail.com",
        "password": "111"
      };

      var res = await _api.post(_endpoints.login, data: body);

      if (res != null && res['success'] == true && res['data'] != null && res['data']['token'] != null) {
        String token = res['data']['token'];

        await AuthStorage().saveToken(token);
        bool biometricOk = await _biometric.authenticate();

        if (biometricOk) {
          await AuthStorage().saveBiometricEnabled(true);
        } else {
          await AuthStorage().saveBiometricEnabled(false);
        }

        Get.offAllNamed(Routes.studentHome);
      } else {
       if(res?['message'] != null){
         Get.snackbar(
           "Login Failed",
           backgroundColor: AppColors.error,
           colorText: Colors.white,
           res?['message'] ?? "Invalid email or password",
           snackPosition: SnackPosition.BOTTOM,
         );
       }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> regenerateToken() async {
    try {
      var res = await _api.post(_endpoints.regenerateToken);

      if (res != null && res['success'] == true && res['data'] != null && res['data']['token'] != null) {

        String token = res['data']['token'];
        await AuthStorage().saveToken(token);
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

}
