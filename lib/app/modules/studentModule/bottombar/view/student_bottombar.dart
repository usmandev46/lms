import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:lms/app/core/constants/app_colors.dart';
import 'package:lms/app/modules/studentModule/class/view/class_view.dart';
import 'package:lms/app/modules/studentModule/home/view/home_view.dart';

import '../../../../core/theme/theme_controller.dart';
import '../../quiz/view/quiz_view.dart';
import '../../setting/view/setting_view.dart';
import '../controller/bottom_bar_controller.dart';

class StudentBottomBar extends StatelessWidget {
  StudentBottomBar({super.key});
  final StudentBottomNavController controller =
      Get.find<StudentBottomNavController>();

  final List<Widget> _pages = [
    StudentHomeView(),
    StudentQuizView(),
    StudentClassView(),
    StudentSettingsView(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.report_gmailerrorred_sharp,
    Icons.check_box,
    Icons.settings,
  ];

  final List<String> labels = ["Home", "Quiz", "Class", "Setting"];

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Scaffold(
      body: Obx(() => _pages[controller.selectedIndex.value]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // themeController.toggleTheme();
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.accent,
        child: Obx(
          () => Icon(
            themeController.isDark.value ? Icons.dark_mode : Icons.light_mode,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar.builder(
          itemCount: icons.length,
          activeIndex: controller.selectedIndex.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          notchMargin: 8,
          backgroundColor: Theme.of(context).colorScheme.primary,
          onTap: controller.changePage,
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          tabBuilder: (index, isActive) {
            final color = controller.selectedIndex.value == index
                ? Colors.white
                : Colors.white54;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icons[index], color: color),
                Text(
                  labels[index],
                  style: TextStyle(color: color, fontSize: 10),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
