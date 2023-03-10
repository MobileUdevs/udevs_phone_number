// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:udevs_phone_number/src/plugin/udevs_phone_number_platform_interface.dart';

/// A web implementation of the UdevsPhoneNumberPlatform of the UdevsPhoneNumber plugin.
class UdevsPhoneNumberWeb extends UdevsPhoneNumberPlatform {
  /// Constructs a UdevsPhoneNumberWeb
  UdevsPhoneNumberWeb();

  static void registerWith(Registrar registrar) {
    UdevsPhoneNumberPlatform.instance = UdevsPhoneNumberWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPhoneNumber() async {
    final version = html.window.navigator.userAgent;
    return version;
  }
}
