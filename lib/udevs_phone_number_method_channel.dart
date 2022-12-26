import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'udevs_phone_number_platform_interface.dart';

/// An implementation of [UdevsPhoneNumberPlatform] that uses method channels.
class MethodChannelUdevsPhoneNumber extends UdevsPhoneNumberPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('udevs_phone_number');

  @override
  Future<String?> getPhoneNumber() async {
    final version = await methodChannel.invokeMethod<String>('getPhoneNumber');
    return version;
  }
}
