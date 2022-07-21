// Autogenerated from Pigeon (v3.1.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PigeonAmapCoordinateType) {
  PigeonAmapCoordinateTypeBaidu = 0,
  PigeonAmapCoordinateTypeMapbar = 1,
  PigeonAmapCoordinateTypeGps = 2,
  PigeonAmapCoordinateTypeMapabc = 3,
  PigeonAmapCoordinateTypeSosomap = 4,
  PigeonAmapCoordinateTypeAliyun = 5,
  PigeonAmapCoordinateTypeGoogle = 6,
};

@class AMapLatLng;

@interface AMapLatLng : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithLatitude:(NSNumber *)latitude
    longitude:(NSNumber *)longitude;
@property(nonatomic, strong) NSNumber * latitude;
@property(nonatomic, strong) NSNumber * longitude;
@end

/// The codec used by AMapToolApi.
NSObject<FlutterMessageCodec> *AMapToolApiGetCodec(void);

@protocol AMapToolApi
/// @return `nil` only when `error != nil`.
- (nullable AMapLatLng *)convertLatLngLatLng:(AMapLatLng *)latLng type:(NSNumber *)type error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void AMapToolApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<AMapToolApi> *_Nullable api);

NS_ASSUME_NONNULL_END
