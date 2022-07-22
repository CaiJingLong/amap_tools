//
//  AMapToolConverter.m
//  amap_tools
//
//  Created by jinglong cai on 2022/7/22.
//

#import "AMapToolConverter.h"

CLLocationCoordinate2D AMapLatLngToCLLocationCoordinate2D(AMapLatLng* latLng){
    return CLLocationCoordinate2DMake(latLng.latitude.doubleValue, latLng.longitude.doubleValue);
}

AMapLatLng* CLLocationCoordinate2DToAmapLatLng(CLLocationCoordinate2D latLng){
    return [AMapLatLng makeWithLatitude:@(latLng.latitude) longitude:@(latLng.longitude)];
}
