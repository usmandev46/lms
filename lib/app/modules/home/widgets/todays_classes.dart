import 'package:flutter/material.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/custom_widgets/my_text.dart';
import '../../../core/theme/theme_controller.dart';

Widget todaysClasses(ThemeController theme) {
  final classesToday = [
    {"subject": "Math", "time": "8:00 AM"},
    {"subject": "Physics", "time": "10:00 AM"},
    {"subject": "English", "time": "12:00 PM"},
  ];

  return Container(
    padding: EdgeInsets.all(4.w),
    decoration: BoxDecoration(
      color: theme.isDark.value
          ? Colors.white12
          : AppColors.primary.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        ...classesToday.asMap().entries.map((entry) {
          final index = entry.key;
          final cls = entry.value;

          return Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.menu_book,
                      size: 18.sp,
                      color: AppColors.primary,
                    ),
                  ),

                  4.width,

                  Expanded(
                    child: MyText(
                      cls["subject"]!,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 1.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MyText(
                      cls["time"]!,
                      fontSize: 13.5.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              if (index != classesToday.length - 1)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  child: Divider(
                    thickness: 0.6,
                    color: Colors.grey.withValues(alpha: 0.3),
                  ),
                ),
            ],
          );
        }),
      ],
    ),
  );
}