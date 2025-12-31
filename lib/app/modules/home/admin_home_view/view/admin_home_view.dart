import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';
import 'package:lms/app/modules/home/widgets/custom_home_appBar.dart';
import 'package:lms/app/modules/home/widgets/profile_banner.dart';
import 'package:sizer/sizer.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/theme/theme_controller.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_admin_app_drawer.dart';

import '../widgets/accounts_summary.dart';
import '../widgets/active_users_list.dart';
import '../widgets/dashboard_stats_grid.dart';
import '../widgets/reports_card.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final controller = Get.find<AdminHomeController>();

    return Scaffold(
      appBar: customHomeAppBar(context),
      drawer: Obx(() {
        final data = controller.dashboardData.value;
        // if (controller.isLoading.isTrue || data == null) {
        //   return const SizedBox();
        // }

        return CustomAdminAppDrawer(
          name: data == null ? "" : data.data.currentUser.name,
          email: data == null ? "" : data.data.currentUser.email,
          imagePath: Assets.logo.profile.path,
        );
      }),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = controller.dashboardData.value;
          if (data == null) {
            return const Center(
              child: MyText("No data found", color: Colors.grey),
            );
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileBanner(
                  themeController,
                  context,
                  name: data.data.currentUser.name,
                  email: data.data.currentUser.email,
                  phone: "0341 7021654",
                ),

                2.height,
                _sectionTitle("🧑‍🤝‍🧑 Active Users"),
                1.height,
                ActiveUsersSection(theme: themeController),

                2.height,
                _sectionTitle("📊 Reports"),
                1.height,
                ReportsCard(controller: controller),

                2.height,
                _sectionTitle("🗓 Key Statistics"),
                1.height,
                DashboardStatsSection(
                  theme: themeController,
                  stats: data.data.toJson(),
                ),

                2.height,
                _sectionTitle("💼 Accounts Summary"),
                1.height,
                AccountsSummarySection(
                  theme: themeController,
                  controller: controller,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return MyText(title, fontSize: 15.sp, fontWeight: FontWeight.bold);
  }
}
