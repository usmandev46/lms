import 'package:flutter/material.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/theme/theme_controller.dart';


Widget todaysClasses(ThemeController theme) {
  final classesToday = [
    {"subject": "Math", "time": "8:00 AM"},
    {"subject": "Physics", "time": "10:00 AM"},
    {"subject": "English", "time": "12:00 PM"},
    {"subject": "Chemistry", "time": "2:00 PM"},
    {"subject": "Computer", "time": "4:00 PM"},
    {"subject": "Biology", "time": "6:00 PM"},
  ];

  final subjectIcons = {
    "Math": Icons.calculate,
    "Physics": Icons.science,
    "Chemistry": Icons.biotech,
    "English": Icons.menu_book,
    "Computer": Icons.computer,
    "Biology": Icons.eco,
  };

  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: classesToday.length,
    itemBuilder: (context, index) {
      final cls = classesToday[index];
      final icon = subjectIcons[cls["subject"]!] ?? Icons.book;

      return Container(
        margin: EdgeInsets.symmetric(vertical: 1.h),
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12)
                // shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 4.sp,
                color: AppColors.primary,
              ),
            ),

            4.width,

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    cls["subject"]!,
                    fontSize: 1.7.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  MyText(
                    "Dr.smith - Room 106",
                    fontSize: 1.5.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyText(
                  cls["time"]!,
                  fontSize: 1.8.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                MyText(
                  "60 min",
                  fontSize: 1.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}