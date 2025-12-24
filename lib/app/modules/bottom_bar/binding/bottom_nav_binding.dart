import 'package:get/get.dart';

import '../controller/bottom_bar_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController(),
      fenix: true,
    );
  }
}
