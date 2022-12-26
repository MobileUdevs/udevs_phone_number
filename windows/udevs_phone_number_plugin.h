#ifndef FLUTTER_PLUGIN_UDEVS_PHONE_NUMBER_PLUGIN_H_
#define FLUTTER_PLUGIN_UDEVS_PHONE_NUMBER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace udevs_phone_number {

class UdevsPhoneNumberPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  UdevsPhoneNumberPlugin();

  virtual ~UdevsPhoneNumberPlugin();

  // Disallow copy and assign.
  UdevsPhoneNumberPlugin(const UdevsPhoneNumberPlugin&) = delete;
  UdevsPhoneNumberPlugin& operator=(const UdevsPhoneNumberPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace udevs_phone_number

#endif  // FLUTTER_PLUGIN_UDEVS_PHONE_NUMBER_PLUGIN_H_
