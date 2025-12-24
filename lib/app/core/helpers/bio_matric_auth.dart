import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuth {
  final LocalAuthentication _auth = LocalAuthentication();

  bool _isAuthenticating = false;

  Future<bool> isBiometricAvailable() async {
    try {
      final canCheck = await _auth.canCheckBiometrics;
      final supported = await _auth.isDeviceSupported();
      return canCheck && supported;
    } catch (_) {
      return false;
    }
  }

  Future<bool> authenticate() async {
    if (_isAuthenticating) {
      await _auth.stopAuthentication();
      if (kDebugMode) {
        print("🔁 Previous auth cancelled — restarting...");
      }

      _isAuthenticating = false;
      return authenticate();
    }

    _isAuthenticating = true;
    try {
      bool isAvailable = await _auth.canCheckBiometrics;
      if (!isAvailable) return false;

      return await _auth.authenticate(
        localizedReason: 'Authenticate to continue',
        biometricOnly: true,
        sensitiveTransaction: true,
        persistAcrossBackgrounding: false,
      );
    } catch (e) {
      if (kDebugMode) {
        print("Biometric Error: $e");
      }
      return false;
    }
    finally{
      _isAuthenticating = false;
    }
  }

  Future<void> cancel() async {
    await _auth.stopAuthentication();
  }
}
