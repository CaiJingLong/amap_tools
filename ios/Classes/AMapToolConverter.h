//
//  AMapToolConverter.m
//  amap_tools
//
//  Created by jinglong cai on 2022/7/22.
//

#import <Foundation/Foundation.h>
#import "pigeon.h"
#import <CoreLocation/CoreLocation.h>

CLLocationCoordinate2D CLLocationCoordinate2DForAMapLatLng(AMapLatLng* latLng);

AMapLatLng* AmapLatLngForCLLocationCoordinate2D(CLLocationCoordinate2D latLng);
