import 'package:get/get.dart';

import '../controller/class_reports_controller.dart';

class ClassReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassReportsController>(
          () => ClassReportsController(),
      fenix: false,
    );
  }
}
