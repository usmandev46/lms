import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_colors.dart';
import 'package:lms/app/modules/bottom_bar/view/student_bottom_bar.dart';
import '../../../core/helpers/auth_storage.dart';
import '../../../core/helpers/bio_matric_auth.dart';
import '../../../core/helpers/network_helper.dart';
import '../../../routes/app_routes.dart';
import '../../role/view/role_view.dart';

class SplashController extends GetxController {
  final BiometricAuth _biometric = BiometricAuth();

  @override
  void onReady() {
    super.onReady();
    _startAppFlow();
  }


  Future<void> _startAppFlow() async {
    NetworkHelper.init();
    await Future.delayed(const Duration(seconds: 2));

    await _setupRemoteConfig();
    await _handleNavigation();
  }

  Future<void> _setupRemoteConfig() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;

      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(seconds: 0),
        ),
      );

      await remoteConfig.fetchAndActivate();
    } catch (_) {
    }
  }

  Future<void> _handleNavigation() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    String variant = remoteConfig.getString('role_screen_variant');
    if (variant.isEmpty) variant = 'A';

    bool hasToken = await AuthStorage().hasToken();

    if (!hasToken) {
      Get.offAllNamed(Routes.role);
      return;
    }

    bool biometricEnabled = await AuthStorage().getBiometricEnabled();
    if (!biometricEnabled) {
      Get.offAllNamed(Routes.studentHome);
      return;
    }

    bool bioAllowed = await _biometric.isBiometricAvailable();

    if (!bioAllowed) {
      Get.offAllNamed(Routes.studentHome);
      return;
    }

    bool authenticated = await _biometric.authenticate();

    if (authenticated) {
      Get.offAllNamed(Routes.studentHome);
    } else {
      Get.snackbar(
        "Authentication Failed",
        "Please login again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.textLight
      );

      await AuthStorage().removeToken();
      Get.offAllNamed(Routes.role);
    }
  }
}
