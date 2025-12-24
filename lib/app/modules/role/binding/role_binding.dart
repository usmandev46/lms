import 'package:get/get.dart';
import 'package:lms/app/modules/role/controller/role_controller.dart';

class RoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoleController());
  }
}
