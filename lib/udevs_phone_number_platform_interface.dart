import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'udevs_phone_number_method_channel.dart';

abstract class UdevsPhoneNumberPlatform extends PlatformInterface {
  /// Constructs a UdevsPhoneNumberPlatform.
  UdevsPhoneNumberPlatform() : super(token: _token);

  static final Object _token = Object();

  static UdevsPhoneNumberPlatform _instance = MethodChannelUdevsPhoneNumber();

  /// The default instance of [UdevsPhoneNumberPlatform] to use.
  ///
  /// Defaults to [MethodChannelUdevsPhoneNumber].
  static UdevsPhoneNumberPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UdevsPhoneNumberPlatform] when
  /// they register themselves.
  static set instance(UdevsPhoneNumberPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPhoneNumber() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> hasPhonePermission() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> requestPhonePermission() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
