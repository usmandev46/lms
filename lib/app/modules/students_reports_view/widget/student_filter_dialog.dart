import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../core/custom_widgets/my_text.dart';
import '../controller/student_reports_controller.dart';
import '../model/students_filters.dart';

void showFilterDialog(
  BuildContext context, {
  required StudentReportsController controller,
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

                final data = controller.studentFilterReportsList.value;
                if (data == null) {
                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  );
                }

                final Filters filter = data.filters;
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

                            // FilterDropdown<City>(
                            //   icon: Icons.location_city,
                            //   label: "City",
                            //   selectedItem: controller.citySelect.value,
                            //   items: filter.cities,
                            //   onChanged: (v) {
                            //     controller.citySelect.value = v;
                            //   },
                            //   itemLabel: (city) => city.name,
                            // ),

                            FilterDropdown<District>(
                              icon: Icons.map_outlined,
                              label: "Tehsils",
                              items: filter.tehsils,
                              selectedItem: controller.tehsileSelect.value,
                              onChanged: (v) {
                                controller.tehsileSelect.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            FilterDropdown<District>(
                              icon: Icons.map_outlined,
                              label: "District",
                              items: filter.districts,
                              selectedItem: controller.districtSelect.value,
                              onChanged: (v) {
                                controller.districtSelect.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            FilterDropdown<Centers>(
                              icon: Icons.flag_outlined,
                              label: "Domicile",
                              items: filter.provinces,
                              selectedItem: controller.domicileSelect.value,
                              onChanged: (v) {
                                controller.domicileSelect.value = v;
                              },
                              itemLabel: (e) => e.name!,
                            ),

                            FilterDropdown<Gender>(
                              icon: Icons.person,
                              label: "Gender",
                              items: filter.genders,
                              selectedItem: controller.genderSelect.value,
                              onChanged: (v) {
                                controller.genderSelect.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            FilterDropdown<Centers>(
                              icon: Icons.location_on_outlined,
                              label: "Center",
                              items: filter.centers,
                              selectedItem: controller.centerSelect.value,
                              onChanged: (v) {
                                controller.centerSelect.value = v;
                              },
                              itemLabel: (e) => e.name!,
                            ),


                            FilterDropdown<Centers>(
                              icon: Icons.menu_book,
                              label: "Academic",
                              items: filter.concentrations,
                              selectedItem: controller.concentrationsSelect.value,
                              onChanged: (v) {
                                controller.concentrationsSelect.value = v;
                              },
                              itemLabel: (e) => e.title!,
                            ),

                            FilterDropdown<Centers>(
                              icon: Icons.workspace_premium,
                              label: "Degree",
                              items: filter.degrees,
                              selectedItem: controller.degreeSelect.value,
                              onChanged: (d) {
                                controller.degreeSelect.value = d;
                              },
                              itemLabel: (degree) => degree.name!,
                            ),

                            FilterDropdown<Centers>(
                              icon: Icons.access_time,
                              label: "Time Slot",
                              items: filter.timeSlots,
                              selectedItem: controller.timeSlotSelect.value,
                              onChanged: (v) {
                                controller.timeSlotSelect.value = v;
                              },
                              itemLabel: (e) => e.name!,
                            ),

                            FilterDropdown<Course>(
                              icon: Icons.bookmark_added,
                              label: "Preferred Course One",
                              items: filter.courses,
                              selectedItem: controller.courseOneSelect.value,
                              onChanged: (v) {
                                controller.courseOneSelect.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            FilterDropdown<Course>(
                              icon: Icons.bookmark_added_outlined,
                              label: "Preferred Course Two",
                              items: filter.courses,
                              selectedItem: controller.courseTwoSelect.value,
                              onChanged: (v) {
                                controller.courseTwoSelect.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            FilterDropdown<Gender>(
                              icon: Icons.school_outlined,
                              label: "Currently Enrolled",
                              items: filter.status,
                              selectedItem: controller.currentlyEnrolledSelect.value,
                              onChanged: (v) {
                                controller.currentlyEnrolledSelect.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            FilterDropdown<Gender>(
                              icon: Icons.work_history_outlined,
                              label: "Employment Status",
                              items: filter.status,
                              selectedItem: controller.employeeStatusSelect.value,
                              onChanged: (v) {
                                controller.employeeStatusSelect.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            FilterDropdown<Gender>(
                              icon: Icons.info_outline,
                              label: "Status",
                              items: filter.status,
                              selectedItem: controller.statusSelect.value,
                              onChanged: (v) {
                                controller.statusSelect.value = v;
                              },
                              itemLabel: (e) => e.name,
                            ),

                            FilterDropdown<Centers>(
                              icon: Icons.money_outlined,
                              label: "Salary Slab",
                              items: filter.salaries,
                              selectedItem: controller.salarySlabSelect.value,
                              onChanged: (v) {
                                controller.salarySlabSelect.value = v;
                              },
                              itemLabel: (e) => e.title!,
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
                            onPressed: controller.isFetchingReports.isTrue
                                ? null
                                : () {
                              Navigator.pop(context);
                              Future.microtask(() {
                                controller.page.value = 1;
                                controller.clearCache();
                                controller.fetchReports();
                              });
                            },

                            child: MyText(controller.isFetchingReports.isTrue ? "Loading..." : "Apply",color: Colors.white),
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

class FilterDropdown<T> extends StatelessWidget {
  final IconData icon;
  final String label;

  final List<T> items;
  final T? selectedItem;
  final Function(T?)? onChanged;

  final String Function(T) itemLabel;

  const FilterDropdown({
    super.key,
    required this.icon,
    required this.label,
    required this.items,
    this.selectedItem,
    this.onChanged,
    required this.itemLabel,
  });

  @override
  Widget build(BuildContext context) {
    final List<T?> dropdownItems = [null, ...items];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(label,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
            margin: EdgeInsets.only(bottom: 1.8.h, top: 0.5.h),
            height: 5.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T?>(
                value: selectedItem,
                menuMaxHeight: 25.h,
                hint: Row(
                  children: [
                    Icon(
                      icon,
                      size: 18.sp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    2.width,
                    MyText(label, fontSize: 14.sp),
                  ],
                ),
                isExpanded: true,
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                items: dropdownItems.map((item) {
                  if (item == null) {
                    return DropdownMenuItem<T?>(
                      value: null,
                      child: Row(
                        children: [
                          MyText("Select $label", fontSize: 14.sp, color: Colors.black38),
                        ],
                      ),
                    );
                  } else {
                    return DropdownMenuItem<T?>(
                      value: item,
                      child: Row(
                        children: [
                          Icon(
                            icon,
                            size: 16.sp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          2.width,
                          MyText(itemLabel(item), fontSize: 14.sp),
                        ],
                      ),
                    );
                  }
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DatePickerField extends StatelessWidget {
  final IconData icon;
  final String label;
  final DateTime? selectedDate;
  final Function(DateTime?)? onDateSelected;

  const DatePickerField({
    super.key,
    required this.icon,
    required this.label,
    this.selectedDate,
    this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          label,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
        GestureDetector(
          onTap: () async {
            DateTime initialDate = selectedDate ?? DateTime.now();
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (picked != null && onDateSelected != null) {
              onDateSelected!(picked);
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
            margin: EdgeInsets.only(bottom: 1.8.h, top: 0.5.h),
            height: 5.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 18.sp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    2.width,
                    MyText(
                      selectedDate != null
                          ? "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}"
                          : "Select Date",
                      fontSize: 14.sp,
                      color: selectedDate != null ? Colors.black : Colors.grey,
                    ),
                  ],
                ),
                Icon(
                  Icons.calendar_today,
                  color: Theme.of(context).colorScheme.primary,
                  size: 18.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



