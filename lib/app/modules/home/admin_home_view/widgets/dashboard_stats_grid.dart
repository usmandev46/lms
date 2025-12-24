import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/theme/theme_controller.dart';

class DashboardStatsSection extends StatelessWidget {
  final ThemeController theme;
  final Map<String, dynamic> stats;

  const DashboardStatsSection({
    super.key,
    required this.theme,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _item("Branches", stats["totalInstitutes"], Icons.account_tree_outlined),
      _item("Students", stats["totalStudents"], Icons.people_alt_outlined),
      _item("Teachers", stats["totalInstructors"], Icons.school_outlined),
      _item("Courses", stats["totalCourses"], Icons.menu_book_outlined),
      _item("Timetables", stats["totalTimeTables"], Icons.timelapse_outlined),
      _item("Tickets", stats["totalTickets"], Icons.confirmation_number_outlined),
      _item("Enrollments", stats["totalEnrollments"], Icons.how_to_reg_outlined),
      _item("Batches", stats["totalBatches"], Icons.layers_outlined),
      _item("Classes", stats["totalClasses"], Icons.class_outlined),
      _item("Users", stats["totalUsers"], Icons.person_outline),
      _item("Attendance", stats["totalAttendance"], Icons.fact_check_outlined),
      _item("Notifications", stats["totalNotification"], Icons.notifications_active_outlined),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 10.h,
        crossAxisSpacing: 3.w,
        mainAxisSpacing: 2.h,
      ),
      itemBuilder: (_, index) => _StatCard(
        theme: theme,
        data: items[index],
      ),
    );
  }

  Map<String, dynamic> _item(String label, dynamic value, IconData icon) {
    return {
      "label": label,
      "value": value?.toString() ?? "0",
      "icon": icon,
    };
  }
}

class _StatCard extends StatelessWidget {
  final ThemeController theme;
  final Map<String, dynamic> data;

  const _StatCard({required this.theme, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: theme.isDark.value
            ? Colors.white12
            : Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
            child: Icon(
              data["icon"],
              size: 21.sp,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  data["value"],
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
                MyText(
                  data["label"],
                  fontSize: 13.sp,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
