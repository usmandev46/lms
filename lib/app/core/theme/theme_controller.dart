import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme_service.dart';

class ThemeController extends GetxController {
  RxBool isDark = false.obs;

  final ThemeService _themeService = ThemeService();

  @override
  void onInit() {
    super.onInit();
    _loadInitialTheme();
  }

  Future<void> _loadInitialTheme() async {
    isDark.value = await _themeService.loadTheme();
    await _themeService.applySavedTheme();
  }

  ThemeMode get themeMode => isDark.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDark.value = !isDark.value;

    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
    _themeService.saveTheme(isDark.value);
    _themeService.applySavedTheme();
  }

  void updateRole(String role) {
    _themeService.saveRole(role);
    _themeService.applySavedTheme();
  }
}
