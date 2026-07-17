import 'package:get/get.dart';
import 'package:lms/app/modules/studentModule/home/controller/student_home_controller.dart';


class StudentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentHomeController(), fenix: false);
  }
}
