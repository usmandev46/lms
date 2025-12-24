import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.accent,
    onSecondary: Colors.white,
    surface: AppColors.cardBgLight,
    onSurface: AppColors.textPrimary,
    error: AppColors.error,
    onError: Colors.white,
  ),

  scaffoldBackgroundColor: AppColors.bgLight,

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    elevation: 2,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  cardTheme: CardThemeData(
    color: AppColors.cardBgLight,
    elevation: 3,
    shadowColor: AppColors.shadow,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),

  textTheme: TextTheme(
    headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
    headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.textSecondary),
    bodySmall: TextStyle(fontSize: 14, color: AppColors.textSecondary),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
  ),

  dividerColor: AppColors.borderLight,

  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.primary,
    contentTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    behavior: SnackBarBehavior.floating,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.accent,
    foregroundColor: Colors.white,
  ),
);
