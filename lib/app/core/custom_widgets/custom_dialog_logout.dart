import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../modules/role/view/role_view.dart';
import '../../routes/app_routes.dart';
import '../constants/app_colors.dart';
import '../helpers/auth_storage.dart';
import 'my_text.dart';

void showCustomDialog(BuildContext context,{Widget? child1}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: child1 != null ? true : false,
    barrierLabel: "",
    barrierColor: Colors.black.withValues(alpha: 0.35),
    transitionDuration: const Duration(milliseconds: 280),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.85, end: 1.0).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack)),
        child: Opacity(
          opacity: animation.value,
          child:  child1 ?? _glassLogoutDialog(context),
        ),
      );
    },
  );
}

Widget _glassLogoutDialog(BuildContext context) {
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withValues(alpha: 0.15),
              )
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 22.sp,
                child: FittedBox(child:  Icon(Icons.logout_rounded, color: AppColors.error,size: 20.sp,)),),
              1.2.height,

              MyText(
                "Logout",
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,

              ),

              1.height,
              MyText(
                "Are you sure you want to logout?",
                textAlign: TextAlign.center,
                maxLines: 2,
                decoration: TextDecoration.none,
                color: Colors.white70, fontSize: 15.sp,
              ),
              2.height,

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white.withValues(alpha: 0.5)),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        await AuthStorage().removeToken();
                        Get.offAllNamed(Routes.role);
                      },
                      child: const Text("Logout"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}