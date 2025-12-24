import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'custom_admin_app_drawer.dart';

class AdminDrawerWrapper extends StatelessWidget {
  final AdminHomeController controller;

  const AdminDrawerWrapper({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final data = controller.dashboardData.value;
      if (controller.isLoading.isTrue || data == null) {
        return const SizedBox.shrink();
      }

      return CustomAdminAppDrawer(
        name: data.data.currentUser.name,
        email: data.data.currentUser.email,
        imagePath: 'assets/logo/profile.png',
      );
    });
  }
}
