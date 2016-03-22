//
//  Singer.m
//  YiHaiFarm
//
//  Created by Daniel on 15/12/4.
//  Copyright © 2015年 Naive. All rights reserved.
//

#import "Singer.h"

#define LeftColor [UIColor redColor]
#define RightColor [UIColor grayColor]

@implementation Singer

/**
 单例
 @returns
 */
+(Singer *)share {
    static dispatch_once_t pred;
    static Singer *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[Singer alloc] init];
    });
    return shared;
}



- (id)getResult:( id )restr{
    if (restr == nil) {
        return nil;
    }
    NSString *retStr = [[NSString alloc] initWithData:restr encoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id returnValue = [NSJSONSerialization JSONObjectWithData:[retStr dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&error];
    if(error) NSLog(@"JSON Parsing Error: %@", error);
    return returnValue;
}

- (NSString *)getImageUrlWithStr:(NSString *)str{
    
//    NSString *tmpStr = CHECK_VALUE(str);
//    
//    if ([tmpStr contains:@"http"]) {
//        return tmpStr;
//    }else{
//        return [ImageHost stringByAppendingString:tmpStr];
//    
//    
//    
//    }
    return nil;
}

@end
