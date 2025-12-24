import 'package:get/get.dart';
import '../controller/student_reports_controller.dart';

class StudentReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentReportsController>(
      () => StudentReportsController(),
      fenix: false,
    );
  }
}
