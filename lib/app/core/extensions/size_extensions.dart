import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

extension SizeWidgetExtension on num {
  Widget get height => SizedBox(height: h);

  Widget get width => SizedBox(width: w);
}
