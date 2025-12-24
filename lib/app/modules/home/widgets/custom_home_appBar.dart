import 'package:flutter/material.dart';
import 'package:lms/app/core/custom_widgets/my_text.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget customHomeAppBar(
  BuildContext context, {
  Widget? suffixIcon,
  String? title,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(75),
    child: AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      automaticallyImplyLeading: false,
      toolbarHeight: 75,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),

      title: Builder(
        builder: (BuildContext ctx) {
          return Row(
            children: [
              IconButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  } else {
                    Scaffold.of(ctx).openDrawer();
                  }
                },
                icon: Icon(
                  Navigator.of(context).canPop()
                      ? Icons.arrow_back
                      : Icons.menu,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const Spacer(),

              title != null
                  ? MyText(
                      title,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    )
                  : Image.asset("assets/logo/splash_logo.png", height: 7.h),

              const Spacer(),

              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child:
                        suffixIcon ??
                        const Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                  ),
                  suffixIcon == null
                      ? Positioned(
                          right: 4,
                          top: 4,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          );
        },
      ),
    ),
  );
}
