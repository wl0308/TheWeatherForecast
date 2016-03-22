//
//  BaiduLocationManger.m
//  WashApp
//
//  Created by Daniel on 15/6/15.
//  Copyright (c) 2015年 Daniel. All rights reserved.
//

#import "BaiduLocationManger.h"

@implementation BaiduLocationManger


+(BaiduLocationManger *)share;{
    
    static dispatch_once_t onceToken;
    static BaiduLocationManger *shared =nil;
    dispatch_once(&onceToken, ^{
        shared =[[BaiduLocationManger alloc] init];
    });
    
    return shared;
}

// 初始化定位设备
-(id)init
{
    if((self = [super init]))
    {
        
        
        //创建一个实例
        _locService = [[BMKLocationService alloc] init];
        _locService.delegate =self;
//        [BMKLocationService setLocationDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
        
        
    }
    return self;
}

-(void)startLocation{
    [_locService startUserLocationService];
    
    
}
-(void)endLocation{
    
    [_locService stopUserLocationService];
    
    
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation{
    
//    NSLog(@"%@",userLocation.location);
    self.latitude =[NSString stringWithFormat:@"%lf",userLocation.location.coordinate.latitude];
    self.longitude =[NSString stringWithFormat:@"%lf",userLocation.location.coordinate.longitude];
    self.baiduLocation =userLocation;
    if (self.latitude.length >0 && userLocation.location.coordinate.latitude>0) {
        [_locService stopUserLocationService];
        NSLog(@"lat%@-long%@",self.latitude,self.longitude);
    }
    
//    NSLog(@"%@-%@",self.latitude,self.longitude);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    

    self.latitude =[NSString stringWithFormat:@"%lf",userLocation.location.coordinate.latitude];
    self.longitude =[NSString stringWithFormat:@"%lf",userLocation.location.coordinate.longitude];
    self.baiduLocation =userLocation;
    if (self.latitude.length >0 && userLocation.location.coordinate.latitude>0) {
        [_locService stopUserLocationService];
    }
    [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_LoadLocationGetResult object:nil];
//     NSLog(@"%@-%@",self.latitude,self.longitude);
    
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error{
//     NSLog(@"%@",error);
//     [_locService stopUserLocationService];
    
}



@end
