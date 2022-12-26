import Flutter
import UIKit

public class SwiftUdevsPhoneNumberPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "udevs_phone_number", binaryMessenger: registrar.messenger())
    let instance = SwiftUdevsPhoneNumberPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
