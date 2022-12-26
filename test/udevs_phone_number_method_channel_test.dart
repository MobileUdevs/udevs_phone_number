import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:udevs_phone_number/udevs_phone_number_method_channel.dart';

void main() {
  MethodChannelUdevsPhoneNumber platform = MethodChannelUdevsPhoneNumber();
  const MethodChannel channel = MethodChannel('udevs_phone_number');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPhoneNumber(), '42');
  });
}
