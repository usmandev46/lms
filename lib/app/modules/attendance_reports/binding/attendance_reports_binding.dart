import 'package:get/get.dart';

import '../controller/attendance_controller.dart';

class AttendanceReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(
          () => AttendanceController(),
      fenix: false,
    );
  }
}
