import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_colors.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/custom_widgets/custom_dialog_logout.dart';
import '../../../../core/custom_widgets/my_text.dart';
import '../../../../routes/app_routes.dart';

class CustomAdminAppDrawer extends StatelessWidget {
  final String name;
  final String email;
  final String imagePath;

  final Map<String, ValueNotifier<bool>> menuExpanded = {
    "Reports & Stats": ValueNotifier(false),
    "Analytics": ValueNotifier(false),
    "Settings": ValueNotifier(false),
  };

  CustomAdminAppDrawer({
    super.key,
    required this.name,
    required this.email,
    required this.imagePath,
  });

  final Map<String, List<Map<String, dynamic>>> subItems = {
    "Reports & Stats": [
      {
        "title": "Student Reports",
        "icon": Icons.person,
        "route": Routes.studentReports,
      },
      {
        "title": "Student Tracking",
        "icon": Icons.track_changes,
        "route": Routes.studentTracking,
      },
      {
        "title": "Course Reports",
        "icon": Icons.book_outlined,
        "route": Routes.courseReports,
      },
      {
        "title": "Course Enrollments",
        "icon": Icons.how_to_reg_outlined,
        "route": Routes.courseEnrollments,
      },
      {
        "title": "Entry Test Enrollments",
        "icon": Icons.note_alt_outlined,
        "route": Routes.entryTestEnrollments,
      },
      {
        "title": "Class Reports",
        "icon": Icons.class_outlined,
        "route": Routes.classReports,
      },
      {
        "title": "Attendance Reports",
        "icon": Icons.fact_check_outlined,
        "route": Routes.attendanceReports,
      },
      {
        "title": "Quiz Reports",
        "icon": Icons.quiz_outlined,
        "route": Routes.quizReports,
      },
      {
        "title": "Exam Reports",
        "icon": Icons.edit_note_outlined,
        "route": Routes.examReports,
      },
    ],

  "Analytics": [
      {"title": "Dashboard Stats", "icon": Icons.dashboard},
      {"title": "User Insights", "icon": Icons.insights},
    ],
    "Settings": [
      {"title": "Profile Settings", "icon": Icons.person_outline},
      {"title": "App Preferences", "icon": Icons.settings_outlined},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.sp,
                  backgroundImage: AssetImage(imagePath),
                ),
                3.width,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      name,
                      color: Colors.white, fontSize: 18,
                    ),
                    MyText(
                      email,
                        color: Colors.white70,
                        fontSize: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ...menuExpanded.keys.map((menu) {
                  return ValueListenableBuilder<bool>(
                    valueListenable: menuExpanded[menu]!,
                    builder: (context, expanded, _) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () => menuExpanded[menu]!.value = !expanded,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 3.w,
                                vertical: 0.6.h,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        menu == "Reports & Stats"
                                            ? Icons.insert_chart_outlined
                                            : menu == "Analytics"
                                            ? Icons.analytics_outlined
                                            : Icons.settings,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                      2.width,
                                      Text(
                                        menu,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    transitionBuilder: (child, anim) =>
                                        RotationTransition(
                                          turns:
                                              child.key == const ValueKey('plus')
                                              ? Tween(
                                                  begin: 0.75,
                                                  end: 1.0,
                                                ).animate(anim)
                                              : Tween(
                                                  begin: 0.25,
                                                  end: 1.0,
                                                ).animate(anim),
                                          child: child,
                                        ),
                                    child: expanded
                                        ? Icon(
                                            Icons.remove_circle_outline,
                                            key: const ValueKey('minus'),
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                          )
                                        : Icon(
                                            Icons.add_circle_outline,
                                            key: const ValueKey('plus'),
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          AnimatedCrossFade(
                            firstChild: const SizedBox.shrink(),
                            secondChild: Column(
                              children: subItems[menu]!.map((e) {
                                return _drawerTile(
                                  e["icon"],
                                  e["title"],
                                  () {
                                    if (e['route'] != null) {
                                      Get.back();
                                      Get.toNamed(e['route']);
                                    }
                                  },
                                  padding: EdgeInsets.only(left: 10.w),
                                  context: context,
                                );
                              }).toList(),
                            ),
                            crossFadeState: expanded
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 300),
                          ),
                        ],
                      );
                    },
                  );
                }),
                _drawerTile(
                  Icons.logout,
                  "Logout",
                  () {
                    Navigator.of(context).pop();
                    showCustomDialog(context);
                  },
                  isLogout: true,
                  context: context,
                ),
              ],
            ),
          ),
          1.height,
        ],
      ),
    );
  }

  Widget _drawerTile(
    IconData icon,
    String title,
    VoidCallback onTap, {
    required BuildContext context,
    bool isLogout = false,
    EdgeInsetsGeometry? padding,
  }) {
    return ListTile(
      contentPadding: padding ?? const EdgeInsets.symmetric(horizontal: 18),
      leading: Icon(
        icon,
        color: isLogout
            ? AppColors.error
            : Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? AppColors.error : Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      ),
      onTap: onTap,
    );
  }
}
