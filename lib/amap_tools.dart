import 'dart:async';

import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:flutter/services.dart';
import 'src/pigeon.dart';

export 'src/pigeon.dart';

class AmapTools {
  static const MethodChannel _channel = MethodChannel('amap_tools');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 转化坐标系
  /// [latLng] 经纬度
  /// [type] 坐标系类型
  static Future<LatLng> convertCoordinate(
    LatLng latLng,
    PigeonAmapCoordinateType type,
  ) async {
    final api = AMapToolApi();
    final src =
        AMapLatLng(latitude: latLng.latitude, longitude: latLng.longitude);
    final dst = await api.convertLatLng(src, type.index);

    return LatLng(dst.latitude, dst.longitude);
  }
}
