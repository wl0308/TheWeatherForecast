//
//  Singer.h
//  YiHaiFarm
//
//  Created by Daniel on 15/12/4.
//  Copyright © 2015年 Naive. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "UITabbarCommonViewController.h"
@interface Singer : NSObject

+(Singer *) share ;
/**
 *  自定义的tabbar
 */
//@property(nonatomic,strong) UITabbarCommonViewController *customTabbr;

//sd_setImageWithURL
- (id)getResult:( id )restr;


- (NSString *)getImageUrlWithStr:(NSString *)str;


@end
