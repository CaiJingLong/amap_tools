// ignore_for_file: constant_identifier_names

import 'package:pigeon/pigeon.dart';

class AMapLatLng {
  final double latitude;
  final double longitude;

  AMapLatLng(this.latitude, this.longitude);
}

@HostApi()
abstract class AMapToolApi {
  AMapLatLng convertLatLng(AMapLatLng latLng, int type);
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
