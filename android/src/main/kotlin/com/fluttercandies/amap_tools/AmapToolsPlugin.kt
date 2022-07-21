package com.fluttercandies.amap_tools

import android.content.Context
import androidx.annotation.NonNull
import com.amap.api.maps.CoordinateConverter
import com.amap.api.maps.model.LatLng
import com.fluttercandies.amap.pigeon.Pigeon

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AmapToolsPlugin */
class AmapToolsPlugin : FlutterPlugin, MethodCallHandler, Pigeon.AMapToolApi {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
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
        val dst = CoordinateConverter(context)
                .coord(LatLng(latLng.latitude, latLng.longitude))
                .from(CoordinateConverter.CoordType.values()[type.toInt()])
                .convert()

        return Pigeon.AMapLatLng.Builder()
                .setLatitude(dst.latitude)
                .setLongitude(dst.longitude)
                .build()
    }
}
