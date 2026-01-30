import 'package:flutter/material.dart';

import '../utils/app_size.dart';

extension SizeWidgetExtension on num {
  double get h => AppSize.h(toDouble());
  double get w => AppSize.w(toDouble());

  Widget get height => SizedBox(height: h);
  Widget get width => SizedBox(width: w);
}

extension FontSizeExtension on num {
  double get sp => AppSize.h(toDouble());
}