import 'package:flutter/material.dart';

import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/extensions/size_extensions.dart';
import '../../../../core/theme/theme_controller.dart';

Widget subjectsList(ThemeController theme) {
  final subjects = [
    {"name": "Math", "icon": Icons.calculate},
    {"name": "Physics", "icon": Icons.science},
    {"name": "Chemistry", "icon": Icons.biotech},
    {"name": "English", "icon": Icons.menu_book},
    {"name": "Computer", "icon": Icons.computer},
    {"name": "Biology", "icon": Icons.eco},
  ];

  return SizedBox(
    height: 15.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: 22.w,
              height: 22.w,
              margin: EdgeInsets.only(right: 3.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    subjects[index]["icon"] as IconData,
                    size: 3.5.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),

            1.height,

            MyText(
              subjects[index]["name"] as String,
              fontSize: 1.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        );
      },
    ),
  );
}
