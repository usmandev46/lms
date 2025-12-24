import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/custom_widgets/my_text.dart';
import '../../../../core/theme/theme_controller.dart';

class ActiveUsersSection extends StatelessWidget {
  final ThemeController theme;

  const ActiveUsersSection({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"label": "Logged In Students", "value": "1"},
      {"label": "Logged In Teachers", "value": "1"},
      {"label": "Logged In Admins", "value": "1"},
    ];

    return SizedBox(
      height: 10.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: 3.w),
        itemCount: items.length,
        itemBuilder: (_, index) {
          final item = items[index];
          return Container(
            width: 35.w,
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: theme.isDark.value ? Colors.white12 : Colors.blue.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(item["value"]!, fontSize: 18.sp, fontWeight: FontWeight.bold),
                MyText(item["label"]!, textAlign: TextAlign.center, fontSize: 13.sp, fontWeight: FontWeight.w600,),
              ],
            ),
          );
        },
      ),
    );
  }
}
