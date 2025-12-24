import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/custom_widgets/my_text.dart';
import '../controller/home_controller.dart';

class ReportsCard extends StatelessWidget {
  final AdminHomeController controller;

  const ReportsCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final data = controller.dashboardData.value!.data;

    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _row("Female Students", data.totalFemaleStudents),
          const Divider(),
          _row("Male Students", data.totalMaleStudents),
          const Divider(),
          _row("Female Teachers", data.totalFemaleInstructors),
          const Divider(),
          _row("Male Teachers", data.totalMaleInstructors),
        ],
      ),
    );
  }

  Widget _row(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(title, fontSize: 14.sp),
        MyText(value, fontWeight: FontWeight.bold, color: Colors.green, fontSize: 14.sp,),
      ],
    );
  }
}
