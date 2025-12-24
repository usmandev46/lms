import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/custom_widgets/my_text.dart';
import '../../../core/theme/theme_controller.dart';

Widget upcomingEvents(ThemeController theme) {
  final events = [
    {"title": "Math Test", "date": "22 Nov 2025"},
    {"title": "Science Fair", "date": "26 Nov 2025"},
    {"title": "Quiz Competition", "date": "5 Dec 2025"},
  ];

  return Column(
    children: events.map((e) {
      return Container(
        margin: EdgeInsets.only(bottom: 1.5.h),
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: theme.isDark.value
              ? Colors.white12
              : AppColors.primaryLight.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(e["title"]!, fontSize: 14.sp),
            MyText(
              e["date"]!,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.accent,
            ),
          ],
        ),
      );
    }).toList(),
  );
}