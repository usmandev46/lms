import 'package:flutter/material.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';

import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/theme/theme_controller.dart';


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
    child: Row(
      children: [
        const CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage("assets/logo/profile.png"),
        ),

        6.width,

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              name,
              fontSize: 2.2.sp,
              fontWeight: FontWeight.bold,
            ),

            0.8.height,
            Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 1.8.sp,
                  color: Theme.of(context).colorScheme.primary,
                ),
                1.5.width,
                MyText(
                  phone,
                  fontSize: 1.6.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),

            0.6.height,
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 1.8.sp,
                  color: Theme.of(context).colorScheme.primary,
                ),
                1.5.width,
                MyText(
                  email,
                  fontSize: 1.6.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

