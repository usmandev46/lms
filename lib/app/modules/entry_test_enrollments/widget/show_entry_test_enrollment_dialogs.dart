import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';
import 'package:lms/app/modules/entry_test_enrollments/controller/entry_test_enrollments_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../core/custom_widgets/my_text.dart';
import '../../students_reports_view/widget/student_filter_dialog.dart';
import '../model/entry_test_enrollments_filters_model.dart';

void showEntryTestEnrollmentsFilterDialog(
    BuildContext context, {
      required EntryTestEnrollmentsController controller,
    }) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.35),
    builder: (context) {
      return Center(
        child: AnimatedScale(
          duration: Duration(milliseconds: 260),
          curve: Curves.easeOutBack,
          scale: 1,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Obx(() {
                Filters filter =
                    controller.entryTestEnrollmentsFilterList.value!.filters;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          "Filter Reports",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close, size: 22),
                        ),
                      ],
                    ),
                    1.height,

                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            2.height,

                            FilterDropdown<EntryTestEnrollmentsFilterBatch>(
                              icon: Icons.location_city,
                              label: "Batch",
                              selectedItem: controller.batch.value,
                              items: filter.batches,
                              onChanged: (v) {
                                controller.batch.value = v;
                              },
                              itemLabel: (e) => e.title,
                            ),

                            FilterDropdown<EntryTestEnrollmentsFilterEntryTest>(
                              icon: Icons.map_outlined,
                              label: "Entry Test",
                              items: filter.entryTests,
                              selectedItem: controller.entryTests.value,
                              onChanged: (v) {
                                controller.entryTests.value = v;
                              },
                              itemLabel: (e) => e.title,
                            ),

                            FilterDropdown<EntryTestEnrollmentsFilterCourse>(
                              icon: Icons.map_outlined,
                              label: "Course",
                              items: filter.courses,
                              selectedItem: controller.course.value,
                              onChanged: (v) {
                                controller.course.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            FilterDropdown<EntryTestEnrollmentsFilterStatusList>(
                              icon: Icons.map_outlined,
                              label: "Status",
                              items: filter.statusList,
                              selectedItem: controller.status.value,
                              onChanged: (v) {
                                controller.status.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            DatePickerField(
                              icon: Icons.date_range,
                              label: "Registered From",
                              selectedDate: controller.registeredFrom.value,
                              onDateSelected: (date) {
                                controller.registeredFrom.value = date;
                              },
                            ),

                            DatePickerField(
                              icon: Icons.date_range,
                              label: "Registered To",
                              selectedDate: controller.registeredTo.value,
                              onDateSelected: (date) {
                                controller.registeredTo.value = date;
                              },
                            )
                          ],
                        ),
                      ),
                    ),

                    1.height,

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade300,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              controller.resetFilters();
                            },
                            child: MyText("Reset"),
                          ),
                        ),
                        3.width,
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: controller.isLoading.isTrue
                                ? () {}
                                : () {
                              Navigator.pop(context);
                              Future.microtask(() {
                                controller.page.value = 1;
                                controller.clearCache();
                                controller.entryTestEnrollmentsFun();
                              });
                            },
                            child: MyText(
                              controller.isLoading.isTrue
                                  ? "Loading..."
                                  : "Apply",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      );
    },
  );
}
