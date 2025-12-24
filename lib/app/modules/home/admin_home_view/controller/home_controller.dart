import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_colors.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../data/repositories/api_service.dart';
import '../model/AdminHomeDashboard.dart';


class AdminHomeController extends GetxController {
  var isLoading = false.obs;
  var dashboardData = Rxn<AdminHomeDashboardModel>();

  final ApiService _api = ApiService();
  final ApiEndpoints _endpoints = ApiEndpoints();

  @override
  void onReady() {
    super.onReady();
    dashboard();
  }

  void dashboard() async {
    if(isLoading.value) return;
    isLoading.value = true;

    try {
      var res = await _api.get(_endpoints.dashboard);

      if (res != null && res['success'] == true && res['data'] != null) {
        dashboardData.value = AdminHomeDashboardModel.fromJson(res);
      } else {
        if(res?['message'] != null) {
          Get.snackbar(
          "Error",
          res?['message'] ?? "Failed to fetch dashboard",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error,
          colorText: AppColors.textLight
        );
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error,
          colorText: AppColors.textLight
      );
    } finally {
      isLoading.value = false;
    }
  }
}
