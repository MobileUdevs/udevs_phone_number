
import 'udevs_phone_number_platform_interface.dart';

class UdevsPhoneNumber {
  Future<String?> getPlatformVersion() {
    return UdevsPhoneNumberPlatform.instance.getPlatformVersion();
  }
}
