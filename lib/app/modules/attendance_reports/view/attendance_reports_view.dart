import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/modules/attendance_reports/controller/attendance_controller.dart';

import '../../../core/custom_widgets/CustomDataTable.dart';
import '../../../core/custom_widgets/my_text.dart';
import '../../../core/custom_widgets/pagination_widget.dart';
import '../../home/widgets/custom_home_appBar.dart';
import '../widget/show_attendance_filter_dialog.dart';

class AttendanceReportsView extends StatelessWidget {
  const AttendanceReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    final AttendanceController controller = Get.find<AttendanceController>();
    return Scaffold(
        appBar: customHomeAppBar(
          context,
          suffixIcon: GestureDetector(
            onTap: () {
              showAttendanceReportsFilterDialog(context, controller: controller);
            },
            child: Icon(Icons.filter_alt_outlined, color: Colors.white, size: 26),
          ),
          title: "Attendance Reports",
        ),
      body: Obx(() {
        if (controller.isLoading.isTrue &&
            controller.tableSource.rows.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.tableSource.rows.isEmpty) {
          return Center(
            child: MyText(
              "No data available",
              color: Colors.grey,
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  CustomDataTableAdvance(
                      columns: controller.attendanceReportsColumnList,
                      dataSource: controller.tableSource,
                      context: context
                  ),

                  Obx(() => controller.isLoading.value
                      ? Positioned.fill(
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.05),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                      : const SizedBox()),
                ],
              ),

            ),
            PaginationWidget(
              currentPage: controller.page.value,
              totalPages: controller.totalPage.value,
              isLoading: controller.isLoading.value,
              onPageChange: (p) {
                controller.attendanceReportsFun(goToPage: p);
              },
            ),
          ],
        );
      }),

    );
  }
}
