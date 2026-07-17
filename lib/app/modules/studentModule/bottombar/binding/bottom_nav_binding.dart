import 'package:get/get.dart';
import '../controller/bottom_bar_controller.dart';

class StudentBottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentBottomNavController>(() => StudentBottomNavController(),
      fenix: true,
    );
  }
}
