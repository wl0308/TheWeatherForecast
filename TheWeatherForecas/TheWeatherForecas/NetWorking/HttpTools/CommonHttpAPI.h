//
//  CommonHttpAPI.h
//  ThailandGo
//
//  Created by Daniel on 15/10/15.
//  Copyright © 2015年 Daniel. All rights reserved.
//

#import "BaseHTTPRequestOperationManager.h"

@interface CommonHttpAPI : BaseHTTPRequestOperationManager


/**
 *  获取天气数据
 */
+ (void)getWeatherInfoWithParameters:(id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
