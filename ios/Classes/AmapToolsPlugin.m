#import "AmapToolsPlugin.h"
#if __has_include(<amap_tools/amap_tools-Swift.h>)
#import <amap_tools/amap_tools-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "amap_tools-Swift.h"
#endif

@implementation AmapToolsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAmapToolsPlugin registerWithRegistrar:registrar];
}
@end
