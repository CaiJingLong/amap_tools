package com.fluttercandies.amap_tools

import com.amap.api.maps.model.LatLng
import com.fluttercandies.amap.pigeon.Pigeon

fun Pigeon.AMapLatLng.toAmap(): LatLng {
    return LatLng(this.latitude, this.longitude)
}

fun LatLng.toPigeon(): Pigeon.AMapLatLng {
    return Pigeon.AMapLatLng.Builder()
            .setLongitude(longitude)
            .setLatitude(latitude)
            .build()
}

fun <T : Enum<T>> Int.toEnum(values: Array<T>): T {
    return values[this]
}
