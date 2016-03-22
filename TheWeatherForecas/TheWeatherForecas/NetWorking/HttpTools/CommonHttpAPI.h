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
 *  会员签到
 */
+ (void)postMemberSignInWithParameters:(id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/**
 *  获取积分明细
 */
+ (void)getMemberPointsListWithParameters:(id)parameters success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
