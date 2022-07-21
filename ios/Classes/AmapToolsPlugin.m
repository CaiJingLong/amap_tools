#import "AmapToolsPlugin.h"
#if __has_include(<amap_tools/amap_tools-Swift.h>)
#import <amap_tools/amap_tools-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "amap_tools-Swift.h"
#endif

#import "AMapUtility.h"

@implementation AmapToolsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [SwiftAmapToolsPlugin registerWithRegistrar:registrar];
    AMapToolApiSetup(registrar.messenger, [[AmapToolsPlugin alloc] init]);
}

- (nullable AMapLatLng *)convertLatLngLatLng:(nonnull AMapLatLng *)latLng type:(nonnull NSNumber *)type error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    CLLocationCoordinate2D src = CLLocationCoordinate2DMake(latLng.latitude.doubleValue, latLng.longitude.doubleValue);
    
    PigeonAmapCoordinateType srcIntValue = [type intValue];
    AMapCoordinateType srcType;
    
    switch (srcIntValue) {
        case PigeonAmapCoordinateTypeBaidu:
            srcType = AMapCoordinateTypeBaidu;
            break;
        case PigeonAmapCoordinateTypeMapbar:
            srcType = AMapCoordinateTypeMapBar;
            break;
        case PigeonAmapCoordinateTypeGps:
            srcType = AMapCoordinateTypeGPS;
            break;
        case PigeonAmapCoordinateTypeMapabc:
            srcType = AMapCoordinateTypeMapABC;
            break;
        case PigeonAmapCoordinateTypeSosomap:
            srcType = AMapCoordinateTypeSoSoMap;
            break;
        case PigeonAmapCoordinateTypeAliyun:
            srcType = AMapCoordinateTypeAliYun;
            break;
        case PigeonAmapCoordinateTypeGoogle:
            srcType = AMapCoordinateTypeGoogle;
            break;
        default:
            break;
    }
    
    CLLocationCoordinate2D result = AMapCoordinateConvert(src, srcType);
    return [AMapLatLng makeWithLatitude:@(result.latitude) longitude:@(result.longitude)];
}

@end
