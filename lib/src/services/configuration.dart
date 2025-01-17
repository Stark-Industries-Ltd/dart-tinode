import 'dart:io' show Platform;

import '../models/model.dart';

class ConfigService {
  late ServerConfiguration _serverConfiguration;
  late AppSettings _appSettings;
  String? humanLanguage;
  String? deviceToken;
  bool? loggerEnabled;
  String appVersion = '';
  String appName = '';

  ConfigService(bool loggerEnabled) {
    _appSettings = AppSettings(0xFFFFFFF, 503, 1000, 5000);
    deviceToken = null;
    appVersion = '1.0.0-alpha.2';
    humanLanguage = 'en-US';
    this.loggerEnabled = loggerEnabled;
  }

  AppSettings get appSettings {
    return _appSettings;
  }

  ServerConfiguration get serverConfiguration {
    return _serverConfiguration;
  }

  String get userAgent {
    return appName +
        ' (Dart; ' +
        Platform.operatingSystem +
        '); tinode-dart/' +
        appVersion;
  }

  String get platform {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isFuchsia) {
      return 'Fuchsia';
    } else if (Platform.isIOS) {
      return 'ios';
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

  void setServerConfiguration(Map<String, dynamic> configuration) {
    _serverConfiguration = ServerConfiguration(
      build: configuration['build'],
      maxFileUploadSize: configuration['maxFileUploadSize'],
      maxMessageSize: configuration['maxMessageSize'],
      maxSubscriberCount: configuration['maxSubscriberCount'],
      maxTagCount: configuration['maxTagCount'],
      maxTagLength: configuration['maxTagLength'],
      minTagLength: configuration['minTagLength'],
      ver: configuration['ver'],
    );
  }
}
