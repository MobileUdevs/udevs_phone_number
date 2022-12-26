#import "UdevsPhoneNumberPlugin.h"
#if __has_include(<udevs_phone_number/udevs_phone_number-Swift.h>)
#import <udevs_phone_number/udevs_phone_number-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "udevs_phone_number-Swift.h"
#endif

@implementation UdevsPhoneNumberPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUdevsPhoneNumberPlugin registerWithRegistrar:registrar];
}
@end
