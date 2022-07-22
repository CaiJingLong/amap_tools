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
#import "AMapToolConverter.h"
#import "MAGeometry.h"

@implementation AmapToolsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [SwiftAmapToolsPlugin registerWithRegistrar:registrar];
    AMapToolApiSetup(registrar.messenger, [[AmapToolsPlugin alloc] init]);
}

- (nullable AMapLatLng *)convertLatLngLatLng:(nonnull AMapLatLng *)latLng type:(nonnull NSNumber *)type error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    CLLocationCoordinate2D src = AMapLatLngToCLLocationCoordinate2D(latLng);
    
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
    return CLLocationCoordinate2DToAmapLatLng(result);
}

- (nullable NSNumber *)calculateAreaLatLng1:(nonnull AMapLatLng *)latLng1 latLng2:(nonnull AMapLatLng *)latLng2 error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    CLLocationCoordinate2D point1 = AMapLatLngToCLLocationCoordinate2D(latLng1);
    CLLocationCoordinate2D point2 = AMapLatLngToCLLocationCoordinate2D(latLng2);
    
    CLLocationDistance area = MAAreaBetweenCoordinates(point1, point2);
    
    return @(area);
}


- (nullable NSNumber *)calculateDistanceLatLng1:(nonnull AMapLatLng *)latLng1 latLng2:(nonnull AMapLatLng *)latLng2 error:(FlutterError * _Nullable __autoreleasing * _Nonnull)error {
    CLLocationCoordinate2D point1 = AMapLatLngToCLLocationCoordinate2D(latLng1);
    CLLocationCoordinate2D point2 = AMapLatLngToCLLocationCoordinate2D(latLng2);
    
    CLLocationDistance distance = MAMetersBetweenMapPoints(point1, point2);
    
    return @(distance);
}


@end
