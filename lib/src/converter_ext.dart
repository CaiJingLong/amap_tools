import 'package:amap_flutter_base/amap_flutter_base.dart';

import 'pigeon.dart';

extension LatLngExt on LatLng {
  AMapLatLng toAMapLatLng() {
    return AMapLatLng(latitude: latitude, longitude: longitude);
  }
}

extension AMapLatLngExt on AMapLatLng {
  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }
}
