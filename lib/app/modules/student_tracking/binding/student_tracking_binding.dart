import 'package:get/get.dart';

import '../controller/student_tracking_controller.dart';

class StudentTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentTrackingController>(
          () => StudentTrackingController(),
      fenix: false,
    );
  }
}
