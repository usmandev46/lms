import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';

import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/theme/theme_controller.dart';
import '../widgets/custom_app_drawer.dart';
import '../widgets/custom_home_appBar.dart';
import '../widgets/profile_banner.dart';
import '../widgets/recent_result_card.dart';
import '../widgets/subjects_list.dart';
import '../widgets/todays_classes.dart';
import '../widgets/upcoming_events.dart';


class StudentHomeView extends StatelessWidget {
  const StudentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    // final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: customHomeAppBar(context),
      drawer: CustomAppDrawer(
        name: 'Usman Ali',
        email: 'usmandev46@gmail.com',
        imagePath: 'assets/logo/profile.png',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileBanner(
                  themeController,
                  context,
                  name: 'Usman Ali',
                  email: 'usmandev46@gmail.com',
                  phone: '+92 341 7021654',
                ),
                3.height,
                MyText(
                  "📚  Your Subjects",
                  fontSize: 2.sp,
                  fontWeight: FontWeight.bold,
                ),
                1.5.height,
                subjectsList(themeController),

                2.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      "📊  Recent Results",
                      fontSize: 2.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: MyText(
                        "View All",
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 1.5.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                // 1.height,
                recentResultsCard(themeController),

                2.height,
                MyText(
                  "🗓  Upcoming Tests / Events",
                  fontSize: 2.sp,
                  fontWeight: FontWeight.bold,
                ),
                1.5.height,
                upcomingEvents(themeController),
                2.height,
                MyText(
                  "📅  Today’s Classes",
                  fontSize: 2.sp,
                  fontWeight: FontWeight.bold,
                ),
                2.height,
                todaysClasses(themeController),
              ],
            ),
          ),
        )
      ),
    );
  }
}
