import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/core/helpers/romote_config_baseUrl_sevices.dart';
import 'app/core/theme/dark_theme.dart';
import 'app/core/theme/light_theme.dart';
import 'app/core/theme/theme_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await RemoteConfigService.init();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Sizer(
      builder: (p1, p2, p3) {
        return GetMaterialApp(
          defaultTransition: Transition.fade,
          transitionDuration: Duration(milliseconds: 300),
          title: 'LMS',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeController.themeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splash,
          getPages: AppPages.pages,
        );
      },
    );
  }
}