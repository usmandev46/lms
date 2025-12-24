import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';

class RemoteConfigService {
  static final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> init() async {
    await _remoteConfig.setDefaults(<String, dynamic>{
      'base_url': 'http://192.168.1.134:8080/api',
    });

    try {
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      debugPrint("Remote Config fetch failed: $e");
    }
  }

  static String get baseUrl {
    String url = _remoteConfig.getString('base_url');

    if (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }

    if (!url.endsWith('/api')) {
      url = '$url/api';
    }
    return url;
  }
}
