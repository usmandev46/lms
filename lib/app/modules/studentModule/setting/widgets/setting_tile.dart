

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/extensions/size_extensions.dart';

Widget settingTile({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  bool isLogout = false,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 1.5.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
    ),
    child: ListTile(
      leading: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: isLogout
              ? Colors.red.withValues(alpha: 0.1)
              : AppColors.primary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: isLogout ? Colors.red : AppColors.primary),
      ),
      title: MyText(
        title,
        fontWeight: FontWeight.w400,
        fontSize: 1.7.sp,
        color: isLogout ? Colors.red : Colors.black,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 2.sp,
        color: Colors.grey,
      ),
      onTap: onTap,
    ),
  );
}
