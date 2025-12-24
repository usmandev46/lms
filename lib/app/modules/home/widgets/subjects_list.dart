import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/custom_widgets/my_text.dart';
import '../../../core/theme/theme_controller.dart';

Widget subjectsList(ThemeController theme) {
  final subjects = [
    "Math",
    "Physics",
    "Chemistry",
    "English",
    "Computer",
    "Biology",
  ];

  return SizedBox(
    height: 10.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return Container(
          width: 35.w,
          margin: EdgeInsets.only(right: 3.w),
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: theme.isDark.value
                ? Colors.white12
                : AppColors.primaryDark.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: MyText(
              subjects[index],
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    ),
  );
}