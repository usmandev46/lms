import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/extensions/size_extensions.dart';
import 'package:sizer/sizer.dart';
import '../../../core/custom_widgets/my_text.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/logo/splash_logo.png")),
            // Lottie.asset(
            //   'assets/animations/lms_splash.json',
            //   width: 40.width,
            //   height: 25.height,
            //   fit: BoxFit.contain,
            // ),

            3.height,

            MyText(
              "Smart LMS",
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              color: Colors.white,
            ),

            1.height,

            MyText(
              "Learn. Teach. Grow.",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
