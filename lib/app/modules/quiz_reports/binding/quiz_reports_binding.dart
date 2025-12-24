import 'package:get/get.dart';
import '../controller/quiz_controller.dart';

class QuizReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(
          () => QuizController(),
      fenix: false,
    );
  }
}
