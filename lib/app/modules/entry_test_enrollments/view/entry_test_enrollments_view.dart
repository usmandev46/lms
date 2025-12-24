import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/custom_widgets/CustomDataTable.dart';
import '../../../core/custom_widgets/my_text.dart';
import '../../../core/custom_widgets/pagination_widget.dart';
import '../../home/widgets/custom_home_appBar.dart';
import '../controller/entry_test_enrollments_controller.dart';
import '../widget/show_entry_test_enrollment_dialogs.dart';

class EntryTestEnrollmentsView extends StatelessWidget {
  const EntryTestEnrollmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final EntryTestEnrollmentsController controller = Get.find<EntryTestEnrollmentsController>();
    return Scaffold(
        appBar: customHomeAppBar(
          context,
          suffixIcon: GestureDetector(
            onTap: () {
              showEntryTestEnrollmentsFilterDialog(context, controller: controller);
            },
            child: Icon(Icons.filter_alt_outlined, color: Colors.white, size: 26),
          ),
          title: "Entry Test Enrollments",
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
                      columns: controller.entryTestEnrollmentsColumnList,
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
                controller.entryTestEnrollmentsFun(goToPage: p);
              },
            ),
          ],
        );
      }),

    );
  }
}
