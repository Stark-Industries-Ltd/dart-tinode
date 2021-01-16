import 'package:tinode/src/models/configuration.dart';

import 'dart:io' show Platform;

class ConfigService {
  AppSettings _appSettings;
  String humanLanguage;
  String deviceToken;
  bool loggerEnabled;
  String appVersion;
  String appName;

  ConfigService(bool loggerEnabled) {
    _appSettings = AppSettings(
        localSeqId: 0xFFFFFFF,
        networkError: 503,
        errorText: 'Connection failed',
        expireFuturesTimeout: 5000,
        expireFuturesPeriod: 1000,
        networkUser: 418,
        networkUserText: 'Disconnected by client');

    deviceToken = null;
    appVersion = '1.16.0';
    humanLanguage = 'en-US';
    this.loggerEnabled = loggerEnabled;
  }

  AppSettings get appSettings {
    return _appSettings;
  }

  String get userAgent {
    return appName + ' (Dart; ' + Platform.operatingSystem + '); tinode-dart/' + appVersion;
  }

  String get platform {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isFuchsia) {
      return 'isFuchsia';
    } else if (Platform.isIOS) {
      return 'IOS';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else if (Platform.isMacOS) {
      return 'MacOS';
    } else if (Platform.isWindows) {
      return 'Window';
    } else {
      return 'Unknown';
    }
  }
}