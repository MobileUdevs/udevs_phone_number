import 'package:flutter_test/flutter_test.dart';
import 'package:udevs_phone_number/udevs_phone_number.dart';
import 'package:udevs_phone_number/udevs_phone_number_platform_interface.dart';
import 'package:udevs_phone_number/udevs_phone_number_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUdevsPhoneNumberPlatform
    with MockPlatformInterfaceMixin
    implements UdevsPhoneNumberPlatform {

  @override
  Future<String?> getPhoneNumber() => Future.value('42');
}

void main() {
  final UdevsPhoneNumberPlatform initialPlatform = UdevsPhoneNumberPlatform.instance;

  test('$MethodChannelUdevsPhoneNumber is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUdevsPhoneNumber>());
  });

  test('getPlatformVersion', () async {
    UdevsPhoneNumber udevsPhoneNumberPlugin = UdevsPhoneNumber();
    MockUdevsPhoneNumberPlatform fakePlatform = MockUdevsPhoneNumberPlatform();
    UdevsPhoneNumberPlatform.instance = fakePlatform;

    expect(await udevsPhoneNumberPlugin.getPhoneNumber(), '42');
  });
}
