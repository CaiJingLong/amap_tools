import 'dart:async';

import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:flutter/services.dart';
import 'pigeon.dart';
import 'converter_ext.dart';

class AmapTools {
  static const MethodChannel _channel = MethodChannel('amap_tools');

  static final _api = AMapToolApi();

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 转化坐标系
  ///
  /// [latLng] 经纬度
  ///
  /// [type] 坐标系类型
  static Future<LatLng> convertCoordinate(
    LatLng latLng,
    PigeonAmapCoordinateType type,
  ) async {
    final src = latLng.toAMapLatLng();
    final dst = await _api.convertLatLng(src, type.index);
    return LatLng(dst.latitude, dst.longitude);
  }

  /// 计算距离
  ///
  /// [latLng1] 经纬度1
  ///
  /// [latLng2] 经纬度2
  static Future<double> calculateDistance(
    LatLng latLng1,
    LatLng latLng2,
  ) async {
    final src1 = latLng1.toAMapLatLng();
    final src2 = latLng2.toAMapLatLng();
    return _api.calculateDistance(src1, src2);
  }

  /// 计算面积
  ///
  /// [latLng1] 经纬度 1
  ///
  /// [latLng2] 经纬度 2
  static Future<double> calculateArea(
    LatLng latLng1,
    LatLng latLng2,
  ) async {
    final src1 = latLng1.toAMapLatLng();
    final src2 = latLng2.toAMapLatLng();
    return _api.calculateArea(src1, src2);
  }

  /// 计算多边形面积
  ///
  /// [latLngs] 多边形经纬度数组
  static Future<double> calculateAreaOfPolygon(
    List<LatLng> latLngs,
  ) async {
    final srcs = latLngs.map((latLng) => latLng.toAMapLatLng()).toList();
    return _api.calculateAreaOfPolygon(srcs);
  }
}
