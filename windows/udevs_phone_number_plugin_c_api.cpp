#include "include/udevs_phone_number/udevs_phone_number_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "udevs_phone_number_plugin.h"

void UdevsPhoneNumberPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  udevs_phone_number::UdevsPhoneNumberPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
