import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_colors.dart';
import 'package:lms/app/modules/role/controller/role_controller.dart';

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
          "Select Your Role",
          fontSize: 2.5.sp,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image(image: AssetImage("assets/logo/splash_logo.png")),
              // 2.height,
              MyText(
                "Welcome!",
                fontSize: 2.2.sp,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),

              MyText(
                "Please choose your account type to continue your learning journey.",
                fontSize: 1.6.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
              3.height,
              _roleCard(
                context,
                title: "Admin",
                subTitle:
                "Manage school data, users, and overall system settings",
                icon: Icons.admin_panel_settings,
                role: "admin",
                isSelected: controller.selectedRole.value == "admin",
                color: AppColors.adminPrimary,
                onTap: () => controller.selectRole("admin"),
              ),
              2.height,

              _roleCard(
                context,
                title: "Student",
                subTitle:
                    "Access your courses, complete assignments, and track progress",
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
                subTitle:
                    "Manage classes, grade student work, and create curriculum",
                icon: Icons.person,
                role: "teacher",
                isSelected: controller.selectedRole.value == "teacher",
                color: AppColors.teacherPrimary,
                onTap: () => controller.selectRole("teacher"),
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
                      fontSize: 2.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _roleCard(
    BuildContext context, {
    required String title,
    required String subTitle,
    required IconData icon,
    required String role,
    required bool isSelected,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 16.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: isSelected ? color.withValues(alpha: 0.08) : Colors.white,
              borderRadius: BorderRadius.circular(16),
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
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected ? color : color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    size: 4.sp,
                    color: isSelected ? Colors.white : color,
                  ),
                ),

                4.width,

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        title,
                        fontSize: 2.sp,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                        color: isSelected ? color : Colors.black87,
                      ),
                      0.8.height,
                      MyText(
                        subTitle,
                        fontSize: 1.5.sp,
                        maxLines: 2,
                        color: isSelected
                            ? color.withValues(alpha: 0.6)
                            : Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),

                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 2.sp,
                  color: isSelected ? color : Colors.grey,
                ),
              ],
            ),
          ),

          Positioned(
            left: 1,
            top: 0,
            bottom: 0,
            child: Container(
              height: 10.h,
              width: 6,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
