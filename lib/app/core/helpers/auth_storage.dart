import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  static final AuthStorage _instance = AuthStorage._internal();
  factory AuthStorage() => _instance;
  AuthStorage._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _tokenKey = 'auth_token';
  static const String _isBiometricEnabledKey = 'is_biometric_enabled';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> removeToken() async {
    removeBiometricEnabled();
    await _storage.delete(key: _tokenKey);
  }

  Future<bool> hasToken() async {
    String? token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> saveBiometricEnabled(bool isEnabled) async {
    await _storage.write(
      key: _isBiometricEnabledKey,
      value: isEnabled ? "true" : "false",
    );
  }

  Future<bool> getBiometricEnabled() async {
    String? value = await _storage.read(key: _isBiometricEnabledKey);
    return value == "true";
  }

  Future<void> removeBiometricEnabled() async {
    await _storage.delete(key: _isBiometricEnabledKey);
  }
}
