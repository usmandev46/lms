import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';
import 'package:lms/app/modules/home/widgets/custom_app_drawer.dart';
import 'package:lms/app/modules/home/widgets/custom_home_appBar.dart';
import 'package:lms/app/modules/home/widgets/profile_banner.dart';
import 'package:lms/app/modules/home/widgets/recent_result_card.dart';
import 'package:lms/app/modules/home/widgets/subjects_list.dart';
import 'package:lms/app/modules/home/widgets/todays_classes.dart';
import 'package:lms/app/modules/home/widgets/upcoming_events.dart';
import 'package:sizer/sizer.dart';

import '../../../core/custom_widgets/my_text.dart';
import '../../../core/theme/theme_controller.dart';

class BetterHomeView extends StatelessWidget {
  const BetterHomeView({super.key});

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
        child: Obx(() {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileBanner(themeController,context, name: '', email: '', phone: ''),
                  2.height,
                  MyText(
                    "📚  Your Subjects",
                    fontSize: 15.sp,
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
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: MyText(
                          "View All",
                          color:  Theme.of(context).colorScheme.primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  1.height,
                  recentResultsCard(themeController),

                  2.height,
                  MyText(
                    "🗓  Upcoming Tests / Events",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  1.5.height,
                  upcomingEvents(themeController),
                  2.height,
                  MyText(
                    "📅  Today’s Classes",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  2.height,
                  todaysClasses(themeController),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
