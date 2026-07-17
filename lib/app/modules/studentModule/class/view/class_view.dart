import 'package:flutter/material.dart';
import 'package:lms/app/core/custom_widgets/my_elevated_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/extensions/size_extensions.dart';

class StudentClassView extends StatelessWidget {
  const StudentClassView({super.key});

  @override
  Widget build(BuildContext context) {
    final classes = [
      {
        "subject": "Math",
        "title": "Algebra Basics",
        "teacher": "Mr. Ahmed",
        "time": "10:00 AM - 11:00 AM",
        "date": "Today",
        "status": "Live",
        "icon": Icons.calculate,
      },
      {
        "subject": "Physics",
        "title": "Motion & Speed",
        "teacher": "Ms. Sana",
        "time": "12:00 PM - 1:00 PM",
        "date": "Tomorrow",
        "status": "Upcoming",
        "icon": Icons.science,
      },
      {
        "subject": "English",
        "title": "Grammar Rules",
        "teacher": "Mr. Ali",
        "time": "9:00 AM - 10:00 AM",
        "date": "Yesterday",
        "status": "Completed",
        "icon": Icons.menu_book,
      },
      {
        "subject": "Physics",
        "title": "Motion & Speed",
        "teacher": "Ms. Sana",
        "time": "12:00 PM - 1:00 PM",
        "date": "Tomorrow",
        "status": "Upcoming",
        "icon": Icons.science,
      },
      {
        "subject": "English",
        "title": "Grammar Rules",
        "teacher": "Mr. Ali",
        "time": "9:00 AM - 10:00 AM",
        "date": "Yesterday",
        "status": "Completed",
        "icon": Icons.menu_book,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const MyText(
          "My Classes",
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(4.w),
        itemCount: classes.length,
        itemBuilder: (context, index) {
          final item = classes[index];

          final isLive = item["status"] == "Live";
          final isCompleted = item["status"] == "Completed";

          return Container(
            margin: EdgeInsets.only(bottom: 2.h),
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Subject + Status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor:
                          AppColors.primary.withValues(alpha: 0.12),
                          child: Icon(
                            item["icon"] as IconData,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                        3.width,
                        MyText(
                          item["subject"] as String,
                          fontSize: 1.6.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.w, vertical: 0.8.h),
                      decoration: BoxDecoration(
                        color: isLive
                            ? Colors.red.withValues(alpha: 0.12)
                            : isCompleted
                            ? Colors.green.withValues(alpha: 0.12)
                            : Colors.orange.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: MyText(
                        item["status"] as String,
                        fontSize: 1.3.sp,
                        fontWeight: FontWeight.w600,
                        color: isLive
                            ? Colors.red
                            : isCompleted
                            ? Colors.green
                            : Colors.orange,
                      ),
                    ),
                  ],
                ),

                2.height,

                /// Class title
                MyText(
                  item["title"] as String,
                  fontSize: 1.9.sp,
                  fontWeight: FontWeight.w600,
                ),

                1.height,

                /// Teacher
                MyText(
                  "Teacher: ${item["teacher"]}",
                  fontSize: 1.4.sp,
                  color: Colors.grey,
                ),

                1.5.height,

                /// Time & date
                Row(
                  children: [
                    Icon(Icons.schedule,
                        size: 18, color: Colors.grey),
                    1.width,
                    MyText(
                      item["time"] as String,
                      fontSize: 1.4.sp,
                      color: Colors.grey,
                    ),
                    4.width,
                    Icon(Icons.calendar_today,
                        size: 16, color: Colors.grey),
                    1.width,
                    MyText(
                      item["date"] as String,
                      fontSize: 1.4.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),

                2.5.height,

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isCompleted ? () {} : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      isLive ? Colors.red : AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 1.6.h),
                    ),
                    child: MyText(
                      isCompleted
                          ? "View Recording"
                          : isLive
                          ? "Join Class"
                          : "Set Reminder",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
