import 'udevs_phone_number_platform_interface.dart';

class UdevsPhoneNumber {
  Future<String?> getPhoneNumber() {
    return UdevsPhoneNumberPlatform.instance.getPhoneNumber();
  }

  Future<void> requestPhonePermission() {
    return UdevsPhoneNumberPlatform.instance.requestPhonePermission();
  }

  Future<bool> hasPhonePermission() {
    return UdevsPhoneNumberPlatform.instance.hasPhonePermission();
  }
}
