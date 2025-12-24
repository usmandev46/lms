import 'package:get/get.dart';

import '../controller/course_reports_controller.dart';

class CourseReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseReportsController>(
          () => CourseReportsController(),
      fenix: false,
    );
  }
}
