//
//  CommonRequestModel.h
//  ThailandGo
//
//  Created by Daniel on 15/10/15.
//  Copyright © 2015年 Daniel. All rights reserved.
//

#import "BaseRequestParamsModel.h"

@interface CommonRequestModel : BaseRequestParamsModel


/**
 *  经纬度搜索
 */
+ (NSMutableDictionary *)getCabinetListWithLocation:(NSString *)location;

/**
 *  名称搜索
 */
+ (NSMutableDictionary *)getSearchCabinetWithAddress:(NSString *)address;

@end
