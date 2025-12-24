import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_colors.dart';
import 'package:lms/app/modules/role/controller/role_controller.dart';
import 'package:sizer/sizer.dart';
import '../../../core/custom_widgets/my_text.dart';
import '../../../core/extensions/size_extensions.dart';

class RoleSelectionView extends StatelessWidget {
  final String? variant;
  const RoleSelectionView({super.key, this.variant = 'A'});

  @override
  Widget build(BuildContext context) {
    final RoleController controller = Get.find<RoleController>();
      return RoleScreenVariantA(controller: controller);
  }
}

class RoleScreenVariantA extends StatelessWidget {
  final RoleController controller;
  const RoleScreenVariantA({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          "Select Role",
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        child: Obx(() {
          return Column(
            children: [
              Image(image: AssetImage("assets/logo/splash_logo.png")),
              2.height,
              MyText(
                "Choose your account type",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              2.height,

              _roleCard(
                context,
                title: "Student",
                icon: Icons.school,
                role: "student",
                isSelected: controller.selectedRole.value == "student",
                color: AppColors.studentPrimary,
                onTap: () => controller.selectRole("student"),
              ),

              2.height,

              _roleCard(
                context,
                title: "Teacher",
                icon: Icons.person,
                role: "teacher",
                isSelected: controller.selectedRole.value == "teacher",
                color: AppColors.teacherPrimary,
                onTap: () => controller.selectRole("teacher"),
              ),

              2.height,

              _roleCard(
                context,
                title: "Admin",
                icon: Icons.admin_panel_settings,
                role: "admin",
                isSelected: controller.selectedRole.value == "admin",
                color: AppColors.adminPrimary,
                onTap: () => controller.selectRole("admin"),
              ),

              Spacer(),

              GestureDetector(
                onTap: controller.selectedRole.value.isEmpty
                    ? null
                    : () => controller.goNext(),
                child: Container(
                  height: 6.5.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: controller.selectedRole.value.isEmpty
                        ? Colors.grey
                        : Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: MyText(
                      "Next",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
  Widget _roleCard(
      BuildContext context, {
        required String title,
        required IconData icon,
        required String role,
        required bool isSelected,
        required Color color,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 8.h,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: isSelected ? color.withValues(alpha: 0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? color : AppColors.grey,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon,
                size: 28.sp,
                color: isSelected ? color : Theme.of(context).colorScheme.primary),
            5.width,
            MyText(
              title,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: isSelected ? color : null,
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios,
                size: 14.sp,
                color: isSelected ? color : Theme.of(context).colorScheme.primary),
          ],
        ),
      ),
    );
  }
}



Widget _roleCardModern({
  required String title,
  required String subtitle,
  required IconData icon,
  required Color color,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? color.withValues(alpha: 0.12) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isSelected ? color : Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.2),
            child: Icon(icon, color: color),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(title, fontSize: 15.sp, fontWeight: FontWeight.bold),
                SizedBox(height: 4),
                MyText(subtitle, fontSize: 11.sp, color: Colors.grey),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios,
              size: 14.sp, color: isSelected ? color : Colors.grey),
        ],
      ),
    ),
  );
}
