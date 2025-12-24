import 'package:get/get.dart';

import '../controller/exam_reports_controller.dart';

class ExamReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamReportsController>(
          () => ExamReportsController(),
      fenix: false,
    );
  }
}
