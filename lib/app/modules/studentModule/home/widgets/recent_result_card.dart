import 'package:flutter/material.dart';

import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/extensions/size_extensions.dart';
import '../../../../core/theme/theme_controller.dart';


Widget recentResultsCard(ThemeController theme) {
  final results = [
    {"subject": "Math Quiz", "percentage": "85%", "grade": "A"},
    {"subject": "Physics Midterm", "percentage": "92%", "grade": "A+"},
    {"subject": "English Test", "percentage": "78%", "grade": "B+"},
    {"subject": "Science", "percentage": "78%", "grade": "A-"},
    {"subject": "Chemistry", "percentage": "86%", "grade": "A"},
    {"subject": "English Quiz", "percentage": "76%", "grade": "B"},
  ];

  return SizedBox(
    height: 15.h,
    child: ListView.builder(
      padding: EdgeInsets.all(4),
      scrollDirection: Axis.horizontal,
      itemCount: results.length,
      itemBuilder: (context, index) {
        final res = results[index];

        return Container(
          width: 30.w,
          margin: EdgeInsets.only(right: 3.w),
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                res["subject"]!,
                fontSize: 1.5.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                textAlign: TextAlign.center,
              ),

              1.height,

              MyText(
                res["percentage"]!,
                fontSize: 2.2.sp,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                textAlign: TextAlign.center,
              ),

              0.8.height,

              MyText(
                res["grade"]!,
                fontSize: 1.4.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    ),
  );
}
