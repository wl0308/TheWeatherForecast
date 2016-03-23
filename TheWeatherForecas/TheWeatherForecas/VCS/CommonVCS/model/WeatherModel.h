//
//  WeatherModel.h
//  TheWeatherForecas
//
//  Created by Naive on 16/3/23.
//  Copyright © 2016年 Naive. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Result,Sk,Today,Weather_Id,Future,Weather_Id;
@interface WeatherModel : NSObject

@property (nonatomic, strong) Result *result;

@property (nonatomic, copy) NSString *resultcode;

@property (nonatomic, copy) NSString *reason;

@property (nonatomic, assign) NSInteger error_code;

@end
@interface Result : NSObject

@property (nonatomic, strong) Sk *sk;

@property (nonatomic, strong) Today *today;

@property (nonatomic, strong) NSArray<Future *> *future;

@end

@interface Sk : NSObject

@property (nonatomic, copy) NSString *humidity;

@property (nonatomic, copy) NSString *wind_direction;

@property (nonatomic, copy) NSString *temp;

@property (nonatomic, copy) NSString *wind_strength;

@property (nonatomic, copy) NSString *time;

@end

@interface Today : NSObject

@property (nonatomic, copy) NSString *temperature;

@property (nonatomic, copy) NSString *dressing_index;

@property (nonatomic, copy) NSString *dressing_advice;

@property (nonatomic, copy) NSString *uv_index;

@property (nonatomic, copy) NSString *comfort_index;

@property (nonatomic, copy) NSString *wind;

@property (nonatomic, copy) NSString *weather;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, copy) NSString *date_y;

@property (nonatomic, copy) NSString *week;

@property (nonatomic, copy) NSString *wash_index;

@property (nonatomic, strong) Weather_Id *weather_id;

@property (nonatomic, copy) NSString *travel_index;

@property (nonatomic, copy) NSString *exercise_index;

@property (nonatomic, copy) NSString *drying_index;

@end

@interface Weather_Id : NSObject

@property (nonatomic, copy) NSString *fa;

@property (nonatomic, copy) NSString *fb;

@end

@interface Future : NSObject

@property (nonatomic, copy) NSString *temperature;

@property (nonatomic, copy) NSString *wind;

@property (nonatomic, copy) NSString *week;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *weather;

@property (nonatomic, strong) Weather_Id *weather_id;

@end


