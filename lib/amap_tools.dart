
import 'dart:async';

import 'package:flutter/services.dart';

class AmapTools {
  static const MethodChannel _channel = MethodChannel('amap_tools');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
