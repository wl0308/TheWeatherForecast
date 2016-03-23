//
//  CommonHttpAPI.m
//  ThailandGo
//
//  Created by Daniel on 15/10/15.
//  Copyright © 2015年 Daniel. All rights reserved.
//

#import "CommonHttpAPI.h"

@implementation CommonHttpAPI

/**
 *  获取天气数据
 */
+ (void)getWeatherInfoWithParameters:(NSString *)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    [[self sharedManager] defaultGetWithMethod:parameters WithParameters:nil success:success failure:failure];
}
///**
// *  获取积分明细
// */
//+ (void)getMemberPointsListWithParameters:(id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
//{
//    [[self sharedManager] defaultGetWithMethod:[self getUrl:member_points_list addEspecid:nil needToken:YES params:nil] WithParameters:parameters success:success failure:failure];
//}
@end
