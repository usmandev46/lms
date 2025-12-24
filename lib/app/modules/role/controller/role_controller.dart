import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lms/app/modules/login/view/login_view.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/theme_controller.dart';

class RoleController extends GetxController {
  RxString selectedRole = "".obs;
  Color selectedColor = AppColors.primary;

  static const _keyRole = "role_save";

  @override
  void onInit() {
    super.onInit();
    _loadSavedRole();
  }

  Future<void> _loadSavedRole() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedRole = prefs.getString(_keyRole);
    if (savedRole != null && savedRole.isNotEmpty) {
      selectRole(savedRole, save: false);
    }
  }

  void selectRole(String role, {bool save = true}) async {
    selectedRole.value = role;

    if (role == "student") {
      selectedColor = AppColors.studentPrimary;
    } else if (role == "teacher") {
      selectedColor = AppColors.teacherPrimary;
    } else {
      selectedColor = AppColors.adminPrimary;
    }

    Get.changeTheme(
      ThemeData(
        brightness: Get.theme.brightness,
        colorScheme: ColorScheme.fromSeed(seedColor: selectedColor),
        useMaterial3: true,
      ),
    );

    if (save) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyRole, role);
    }
  }

  void goNext() {
    Get.find<ThemeController>().updateRole(selectedRole.value);
    Get.to(() => LoginView());
  }
}
