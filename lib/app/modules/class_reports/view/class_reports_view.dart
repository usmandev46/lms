import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/custom_widgets/CustomDataTable.dart';
import '../../../core/custom_widgets/my_text.dart';
import '../../../core/custom_widgets/pagination_widget.dart';
import '../../home/widgets/custom_home_appBar.dart';
import '../controller/class_reports_controller.dart';
import '../widget/class_reports_filter_dialogs.dart';

class ClassReportsView extends StatelessWidget {
  const ClassReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ClassReportsController controller = Get.find<ClassReportsController>();
    return Scaffold(
        appBar: customHomeAppBar(
          context,
          suffixIcon: GestureDetector(
            onTap: () {
              showClassReportsFilterDialog(context, controller: controller);
            },
            child: Icon(Icons.filter_alt_outlined, color: Colors.white, size: 26),
          ),
          title: "Class Reports",
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
                      columns: controller.classReportsColumnList,
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
                controller.classReportsFun(goToPage: p);
              },
            ),
          ],
        );
      }),

    );
  }
}
