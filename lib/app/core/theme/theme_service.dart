import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const _keyTheme = "isDarkMode";
  static const _keyRole = "role_save";

  Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyTheme) ?? false;
  }

  Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_keyTheme, isDark);
  }

  Future<void> saveRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyRole, role);
  }

  Future<void> applySavedTheme() async {
    final prefs = await SharedPreferences.getInstance();

    bool isDark = prefs.getBool(_keyTheme) ?? false;
    String? role = prefs.getString(_keyRole);

    Color seedColor;
    if (role == "student") {
      seedColor = AppColors.studentPrimary;
    } else if (role == "teacher") {
      seedColor = AppColors.teacherPrimary;
    } else if (role == "admin") {
      seedColor = AppColors.adminPrimary;
    } else {
      seedColor = AppColors.primary;
    }

    Get.changeTheme(
      ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      ),
    );

  }
}
