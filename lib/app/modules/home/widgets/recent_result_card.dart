import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/custom_widgets/my_text.dart';
import '../../../core/theme/theme_controller.dart';

Widget recentResultsCard(ThemeController theme) {
  return Container(
    padding: EdgeInsets.all(4.w),
    decoration: BoxDecoration(
      color: Colors.green.shade100.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        _resultRow("Math Quiz", "85%"),
        Divider(),
        _resultRow("Physics Midterm", "92%"),
        Divider(),
        _resultRow("English Test", "78%"),
      ],
    ),
  );
}

Widget _resultRow(String title, String marks) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      MyText(title, fontSize: 14.sp),
      MyText(
        marks,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    ],
  );
}