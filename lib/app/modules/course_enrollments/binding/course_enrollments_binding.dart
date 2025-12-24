import 'package:get/get.dart';

import '../controller/course_enrollemts_controller.dart';

class CourseEnrollmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseEnrollmentsController>(
          () => CourseEnrollmentsController(),
      fenix: false,
    );
  }
}
