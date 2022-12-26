//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <udevs_phone_number/udevs_phone_number_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) udevs_phone_number_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UdevsPhoneNumberPlugin");
  udevs_phone_number_plugin_register_with_registrar(udevs_phone_number_registrar);
}
