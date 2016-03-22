//
//  CommonRequestModel.m
//  ThailandGo
//
//  Created by Daniel on 15/10/15.
//  Copyright © 2015年 Daniel. All rights reserved.
//

#import "CommonRequestModel.h"

@implementation CommonRequestModel

/**
 *  经纬度搜索
 */
+ (NSMutableDictionary *)getCabinetListWithLocation:(NSString *)location {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setObject:location forKey:@"location"];
    
    return [self baseGetInfoFacory:params];
}

/**
 *  名称搜索
 */
+ (NSMutableDictionary *)getSearchCabinetWithAddress:(NSString *)address {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setObject:address forKey:@"address"];
    
    return [self baseGetInfoFacory:params];
}
@end
