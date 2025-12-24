import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../core/custom_widgets/my_text.dart';
import '../../students_reports_view/widget/student_filter_dialog.dart';
import '../controller/student_tracking_controller.dart';
import '../model/studentTrackingFilterMode.dart';

void showStudentTrackingFilterDialog(
    BuildContext context, {
      required StudentTrackingController controller,
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
                TrackingFilters filter = controller.studentTrackingFilterList.value!.filters;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          "Filter Tracking",
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

                            FilterDropdown<TrackingCourse>(
                              icon: Icons.location_city,
                              label: "Course",
                              selectedItem: controller.trackingCourse.value,
                              items: filter.courses,
                              onChanged: (v) {
                                controller.trackingCourse.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            FilterDropdown<TrackingStatus>(
                              icon: Icons.map_outlined,
                              label: "Status",
                              items: filter.statuses,
                              selectedItem: controller.trackingStatus.value,
                              onChanged: (v) {
                                controller.trackingStatus.value = v;
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
                            onPressed: controller.isLoading.isTrue ? () {}
                                : () {
                              Navigator.pop(context);
                              Future.microtask(() {
                                controller.page.value = 1;
                                controller.clearCache();
                                controller.studentTrackingFun();
                              });
                            },
                            child: MyText(controller.isLoading.isTrue ? "Loading..." : "Apply",color: Colors.white),
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



