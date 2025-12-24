import 'package:flutter/material.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../core/custom_widgets/my_text.dart';
import '../../../core/theme/theme_controller.dart';

Widget profileBanner(
  ThemeController theme,
  BuildContext context, {
  required String name,
  required String email,
  required String phone,
}) {
  return Container(
    padding: EdgeInsets.all(4.w),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/logo/profile.png"),
        ),
        8.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              "Welcome $name",
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            MyText(phone, color: Colors.white70, fontSize: 14.sp),
            MyText(email, color: Colors.white70, fontSize: 14.sp),
          ],
        ),
      ],
    ),
  );
}
