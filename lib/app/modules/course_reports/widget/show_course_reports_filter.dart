import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../core/custom_widgets/my_text.dart';
import '../../students_reports_view/widget/student_filter_dialog.dart';
import '../controller/course_reports_controller.dart';
import '../model/course_reports_filter_model.dart';

void showCourseReportsFilterDialog(
  BuildContext context, {
  required CourseReportsController controller,
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
                CourseFilterData filter =
                    controller.courseReportsFilterList.value!.data;
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

                            FilterDropdown<Instructor>(
                              icon: Icons.location_city,
                              label: "Instructor",
                              selectedItem: controller.instructor.value,
                              items: filter.instructors,
                              onChanged: (v) {
                                controller.instructor.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            // FilterDropdown<CourseFilterCategory>(
                            //   icon: Icons.map_outlined,
                            //   label: "Category",
                            //   items: filter.categories,
                            //   selectedItem: controller.category.value,
                            //   onChanged: (v) {
                            //     controller.category.value = v;
                            //   },
                            //   itemLabel: (e) => e.name,
                            // ),
                            //
                            // FilterDropdown<CourseFilterCategory>(
                            //   icon: Icons.map_outlined,
                            //   label: "Sub Category",
                            //   items: filter.subCategories,
                            //   selectedItem: controller.subCategory.value,
                            //   onChanged: (v) {
                            //     controller.subCategory.value = v;
                            //   },
                            //   itemLabel: (e) => e.name,
                            // ),

                            FilterDropdown<CourseType>(
                              icon: Icons.map_outlined,
                              label: "Course Type",
                              items: filter.courseTypes,
                              selectedItem: controller.courseType.value,
                              onChanged: (v) {
                                controller.courseType.value = v;
                              },
                              itemLabel: (e) => e.label,
                            ),
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
                                controller.courseReportsFun();
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
