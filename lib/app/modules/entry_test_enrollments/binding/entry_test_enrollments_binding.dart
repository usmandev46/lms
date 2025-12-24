import 'package:get/get.dart';

import '../controller/entry_test_enrollments_controller.dart';

class EntryTestEnrollmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntryTestEnrollmentsController>(
          () => EntryTestEnrollmentsController(),
      fenix: false,
    );
  }
}
