//
//  NSDictionary+Unicode.m
//  YiHaiFarm
//
//  Created by Daniel on 15/11/30.
//  Copyright © 2015年 Naive. All rights reserved.
//

#import "NSDictionary+Unicode.h"

@implementation NSDictionary (Unicode)


- (NSString*)my_description {
    NSString *desc = [self my_description];
    desc = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    return desc;
}

@end
