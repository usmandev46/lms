import 'package:flutter/material.dart';

class AppSize {
  static double? _screenHeight;
  static double? _screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenHeight = size.height;
    _screenWidth = size.width;
  }

  static double h(double percent) {
    final height = _screenHeight ?? 800;
    return height * (percent / 100);
  }

  static double w(double percent) {
    final width = _screenWidth ?? 400;
    return width * (percent / 100);
  }
}

