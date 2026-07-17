import 'package:flutter/material.dart';

import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/extensions/size_extensions.dart';
import '../widgets/setting_tile.dart';

class StudentSettingsView extends StatelessWidget {
  const StudentSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const MyText("Settings", fontWeight: FontWeight.w600),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                    radius: 30,
                    backgroundImage: AssetImage("assets/logo/profile.png"),
                  ),
                  4.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        "Student Name",
                        fontSize: 1.9.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      MyText(
                        "student@gmail.com",
                        fontSize: 1.4.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            3.height,

            const MyText("Account", fontWeight: FontWeight.w600),
            2.height,

            settingTile(
              icon: Icons.person_outline,
              title: "Profile",
              onTap: () {},
            ),
            settingTile(
              icon: Icons.lock_outline,
              title: "Change Password",
              onTap: () {},
            ),

            3.height,

            const MyText("Preferences", fontWeight: FontWeight.w600),
            2.height,

            settingTile(
              icon: Icons.notifications_none,
              title: "Notifications",
              onTap: () {},
            ),
            settingTile(icon: Icons.language, title: "Language", onTap: () {}),

            3.height,

            const MyText("Academic", fontWeight: FontWeight.w600),
            2.height,

            settingTile(
              icon: Icons.menu_book_rounded,
              title: "My Subjects",
              onTap: () {},
            ),

            settingTile(
              icon: Icons.fact_check_outlined,
              title: "Attendance Summary",
              onTap: () {},
            ),

            settingTile(
              icon: Icons.bar_chart_rounded,
              title: "Result History",
              onTap: () {},
            ),

            3.height,

            const MyText("Security", fontWeight: FontWeight.w600),
            2.height,

            settingTile(
              icon: Icons.fingerprint,
              title: "Biometric Login",
              onTap: () {},
            ),

            settingTile(
              icon: Icons.logout,
              title: "Logout",
              isLogout: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
