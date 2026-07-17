import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/custom_widgets/my_elevated_button.dart';
import '../../../../core/extensions/size_extensions.dart';

class StudentQuizView extends StatelessWidget {
  const StudentQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final quizzes = [
      {
        "subject": "Math",
        "title": "Algebra Quiz",
        "time": "20 min",
        "questions": "10 Questions",
        "status": "Active",
      },
      {
        "subject": "Physics",
        "title": "Motion Test",
        "time": "15 min",
        "questions": "8 Questions",
        "status": "Upcoming",
      },
      {
        "subject": "English",
        "title": "Grammar Quiz",
        "time": "25 min",
        "questions": "12 Questions",
        "status": "Completed",
      },
      {
        "subject": "Math",
        "title": "Algebra Quiz",
        "time": "20 min",
        "questions": "10 Questions",
        "status": "Active",
      },
      {
        "subject": "Physics",
        "title": "Motion Test",
        "time": "15 min",
        "questions": "8 Questions",
        "status": "Upcoming",
      },
      {
        "subject": "English",
        "title": "Grammar Quiz",
        "time": "25 min",
        "questions": "12 Questions",
        "status": "Completed",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const MyText("Quizzes", fontWeight: FontWeight.w600),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(4.w),
        itemCount: quizzes.length,
        itemBuilder: (context, index) {
          final quiz = quizzes[index];

          final isCompleted = quiz["status"] == "Completed";
          final isActive = quiz["status"] == "Active";

          return Container(
            margin: EdgeInsets.only(bottom: 2.h),
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
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
                    _subjectChip(quiz["subject"]!),
                    _statusBadge(quiz["status"]!),
                  ],
                ),

                2.height,

                MyText(
                  quiz["title"]!,
                  fontSize: 1.9.sp,
                  fontWeight: FontWeight.w600,
                ),

                1.8.height,

                Row(
                  children: [
                    _infoItem(icon: Icons.timer_outlined, text: quiz["time"]!),
                    4.width,
                    _infoItem(
                      icon: Icons.help_outline,
                      text: quiz["questions"]!,
                    ),
                  ],
                ),

                3.height,

                SizedBox(
                  width: double.infinity,
                  child: MyElevatedButton(
                    text: isCompleted ? "View Result" : "Start Quiz",
                    onPressed: isCompleted
                        ? () {
                            // open result screen
                          }
                        : () {
                            // start quiz
                          },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _subjectChip(String subject) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.8.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: MyText(
        subject,
        fontSize: 1.4.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
    );
  }

  Widget _statusBadge(String status) {
    Color color;
    if (status == "Completed") {
      color = Colors.green;
    } else if (status == "Active") {
      color = Colors.orange;
    } else {
      color = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.6.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: MyText(
        status,
        fontSize: 1.3.sp,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  Widget _infoItem({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, size: 2.sp, color: Colors.grey),
        1.width,
        MyText(text, fontSize: 1.4.sp, color: Colors.grey),
      ],
    );
  }
}
