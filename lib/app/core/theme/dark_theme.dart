import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.accent,
    onSecondary: Colors.white,
    surface: AppColors.cardBgDark,
    onSurface: AppColors.textLight,
    error: AppColors.error,
    onError: Colors.white,
  ),

  scaffoldBackgroundColor: AppColors.bgDark,

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.bgDark,
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
    color: AppColors.cardBgDark,
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
    headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textLight),
    headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.textLight),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.grey),
    bodySmall: TextStyle(fontSize: 14, color: AppColors.grey),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
  ),

  dividerColor: AppColors.borderDark,

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
