import 'package:get/get.dart';

class StudentHomeController extends GetxController {
  var isLoading = false.obs;


  @override
  void onReady() {
    super.onReady();
    dashboard();
  }

  void dashboard() async {
    if(isLoading.value) return;
    isLoading.value = true;


  }
}