//
//  ToolDefine.h
//  ThailandGo
//
//  Created by Daniel on 15/10/15.
//  Copyright © 2015年 Daniel. All rights reserved.
//

#define LocationMangerTool [LocationManger locationShared]



//在release版本禁止输出NSLog内容
//发布版本时注释 #define IOS_DEBUG
#define IOS_DEBUG
#ifdef IOS_DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...){}
#endif

////检查登录
//#define Check_Login \
//if ([UserInfo isLogin])\
//{\
//}\
//else\
//{\
//[self presentLoginVCAction];\
//return ;\
//}\
//
//
//#define Check_Login_Objc \
//if ([UserInfo isLogin])\
//{\
//}\
//else\
//{\
//[[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:[RegisterViewController navigationControllerContainSelf] animated:YES completion:nil];\
//return ;\
//}\


#define NOTIFICATION_REFRAME                          @"NOTIFICATION_REFRAME"     //重绘界面用


/**
 *  检查数据有效性
 */
#define CHECK_VALUE(value) NSStringExchangeTheReturnValueToString(value)

#define ChangeNSIntegerToStr(value) [CommonMethod changeNsinterToStr:value]

#define NOTIFICATION_LoadLocation                     @"LoadLocation" //重新定位
#define NOTIFICATION_LoadLocationGetResult                     @"NOTIFICATION_LoadLocationGetResult" //拿到定位

#define GET_IMAGEURL_URL(value) [NSURL URLWithString:[[Singer share] getImageUrlWithStr:value]]

//#define TokenToolShared [TotalAccessTokenTool shared]

#define ACCESSTOKEN @"ACCESSTOKEN"
#define REFRESHTOKEN @"REFRESHTOKEN"

#define ISLOGIN @"ISLOGIN"
