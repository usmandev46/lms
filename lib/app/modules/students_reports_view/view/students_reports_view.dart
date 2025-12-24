import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/modules/students_reports_view/controller/student_reports_controller.dart';

import '../../../core/custom_widgets/CustomDataTable.dart';
import '../../../core/custom_widgets/my_text.dart';
import '../../../core/custom_widgets/pagination_widget.dart';
import '../../home/widgets/custom_home_appBar.dart';
import '../widget/student_filter_dialog.dart';

class StudentsReportsView extends StatelessWidget {
  const StudentsReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StudentReportsController>();

    return Scaffold(
      appBar: customHomeAppBar(
        context,
        title: "Student Reports",
        suffixIcon: GestureDetector(
          onTap: () => showFilterDialog(context, controller: controller),
          child: const Icon(
            Icons.filter_alt_outlined,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isFetchingReports.isTrue &&
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
                    columns: controller.studentReportsColumnList,
                    dataSource: controller.tableSource,
                    context: context
                  ),

                  Obx(() => controller.isFetchingReports.value
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
              isLoading: controller.isFetchingReports.value,
              onPageChange: (p) {
                controller.fetchReports(goToPage: p);
              },
            ),
          ],
        );
      }),
    );
  }
}
