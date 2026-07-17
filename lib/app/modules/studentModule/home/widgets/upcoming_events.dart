import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/extensions/size_extensions.dart';
import '../../../../core/theme/theme_controller.dart';


Widget upcomingEvents(ThemeController theme) {
  final events = [
    {"title": "Math", "chapter": "Chapter 4", "date": "12 Oct 2025"},
    {"title": "Science Fair", "chapter": "Physics", "date": "26 Nov 2025"},
    {"title": "Quiz Competition", "chapter": "English", "date": "13 Dec 2025"},
  ];

  return Column(
    children: events.map((e) {
      final dateParts = e["date"]!.split(" ");
      final day = dateParts[0];
      final month = dateParts[1];

      return Container(
        margin: EdgeInsets.only(bottom: 1.5.h),
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    day,
                    fontSize: 1.6.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  MyText(
                    month,
                    fontSize: 1.2.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            3.width,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    e["title"]!,
                    fontSize: 1.6.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  MyText(
                    e["chapter"]!,
                    fontSize: 1.4.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 2.sp,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      );
    }).toList(),
  );
}