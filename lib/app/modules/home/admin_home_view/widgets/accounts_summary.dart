import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/theme/theme_controller.dart';
import '../controller/home_controller.dart';

class AccountsSummarySection extends StatelessWidget {
  final ThemeController theme;
  final AdminHomeController controller;

  const AccountsSummarySection({
    super.key,
    required this.theme,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final data = controller.dashboardData.value!.data;

    final items = [
      _item("Paid Invoices", data.totalInvoicesPaid),
      _item("Pending Invoices", data.totalInvoicesPending),
      _item("Paid Amount", data.totalAmountPaid),
      _item("Pending Amount", data.totalAmountPending),
    ];

    return Column(
      children: items.map((e) {
        return Container(
          margin: EdgeInsets.only(bottom: 1.5.h),
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: theme.isDark.value
                ? Colors.white12
                : AppColors.primaryLight.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(e["title"]!, fontSize: 14.sp),
              MyText(
                e["value"]!,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: AppColors.accent,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Map<String, String> _item(String title, dynamic value) {
    return {"title": title, "value": value.toString()};
  }
}
