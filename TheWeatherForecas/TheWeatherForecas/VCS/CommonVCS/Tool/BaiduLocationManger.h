//
//  BaiduLocationManger.h
//  WashApp
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>
@interface BaiduLocationManger : NSObject<BMKLocationServiceDelegate>{
    
    BMKLocationService* _locService;
    
}

@property(nonatomic, strong) NSString *latitude;//纬度
@property(nonatomic, strong) NSString *longitude;//经度


@property(nonatomic,strong)BMKUserLocation *baiduLocation;

+(BaiduLocationManger *)share;

-(void)startLocation;
-(void)endLocation;

@end
