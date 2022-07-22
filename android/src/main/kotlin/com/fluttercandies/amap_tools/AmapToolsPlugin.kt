package com.fluttercandies.amap_tools

import android.content.Context
import androidx.annotation.NonNull
import com.amap.api.maps.AMapUtils
import com.amap.api.maps.CoordinateConverter
import com.fluttercandies.amap.pigeon.Pigeon

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class AmapToolsPlugin : FlutterPlugin, MethodCallHandler, Pigeon.AMapToolApi {
    private lateinit var channel: MethodChannel

    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "amap_tools")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext

        Pigeon.AMapToolApi.setup(flutterPluginBinding.binaryMessenger, this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun convertLatLng(latLng: Pigeon.AMapLatLng, type: Long): Pigeon.AMapLatLng {
        return CoordinateConverter(context)
                .coord(latLng.toAmap())
                .from(type.toInt().toEnum(CoordinateConverter.CoordType.values()))
                .convert()
                .toPigeon()
    }

    override fun calculateDistance(latLng1: Pigeon.AMapLatLng, latLng2: Pigeon.AMapLatLng): Double {
        return AMapUtils.calculateLineDistance(latLng1.toAmap(), latLng2.toAmap()).toDouble()
    }

    override fun calculateArea(latLng1: Pigeon.AMapLatLng, latLng2: Pigeon.AMapLatLng): Double {
        return AMapUtils.calculateArea(latLng1.toAmap(), latLng2.toAmap()).toDouble()
    }
}
