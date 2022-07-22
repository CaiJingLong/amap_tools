// ignore_for_file: constant_identifier_names

import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class AMapToolApi {
  AMapLatLng convertLatLng(AMapLatLng latLng, int type);

  /// 计算距离
  /// [latLng1] 经纬度1
  /// [latLng2] 经纬度2
  double calculateDistance(AMapLatLng latLng1, AMapLatLng latLng2);

  /// 计算面积
  /// [latLng1] 经纬度 1
  /// [latLng2] 经纬度 2
  double calculateArea(AMapLatLng latLng1, AMapLatLng latLng2);
}

class AMapLatLng {
  final double latitude;
  final double longitude;

  AMapLatLng(this.latitude, this.longitude);
}

enum PigeonAmapCoordinateType {
  baidu,
  mapbar,
  gps,
  mapabc,
  sosomap,
  aliyun,
  google,
}
