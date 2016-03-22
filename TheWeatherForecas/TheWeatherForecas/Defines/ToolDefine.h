//
//  ToolDefine.h
//  ThailandGo
//
//  Created by Daniel on 15/10/15.
//  Copyright © 2015年 Daniel. All rights reserved.
//

#define LocationMangerTool [LocationManger locationShared]
//#import "UserInfo.h"
//#import "NSString+Category.h"
typedef enum ScanTypeWay_
{
    discountType = 1,     //优惠券 扫描二维码
    rechargeType,       //充值卡 扫描二维码
    
}ScanTypeWay;

typedef enum OrderStatusType_
{
    /**
     *  Deleted(-1, "已删除")
     */
    Order_Deleted = -1,
    
    /**
     *  Canceled(0, "已取消")
     */
    Order_Canceled = 0,
    /**
     *  PendingPay(1, "待支付")
     */
    Order_PendingPay = 1,
    /**
     *  PendingDelivery(2, "待配送")
     */
    Order_PendingDelivery = 2,
    /**
     *  PendingTake(3, "待取货")
     */
    Order_PendingTake = 3,
    /**
     *  Completed(4, "已完成")
     */
    Order_Completed = 4,
    /**
     *  Evaluated(5, "已评价")
     */
    Order_Evaluated = 5,
    /**
     *  全部
     */
    Order_All = 100,
    
}OrderStatusType;

//在release版本禁止输出NSLog内容
//发布版本时注释 #define IOS_DEBUG
#define IOS_DEBUG
#ifdef IOS_DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...){}
#endif

//检查登录
#define Check_Login \
if ([UserInfo isLogin])\
{\
}\
else\
{\
[self presentLoginVCAction];\
return ;\
}\


#define Check_Login_Objc \
if ([UserInfo isLogin])\
{\
}\
else\
{\
[[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:[RegisterViewController navigationControllerContainSelf] animated:YES completion:nil];\
return ;\
}\


#define NOTIFICATION_REFRAME                          @"NOTIFICATION_REFRAME"     //重绘界面用

#define NOTIFICATION_ALIPAY                          @"NOTIFICATION_ALIPAY"     //支付宝支付完成回调

/**
 *  检查数据有效性
 */
#define CHECK_VALUE(value) NSStringExchangeTheReturnValueToString(value)

#define ChangeNSIntegerToStr(value) [CommonMethod changeNsinterToStr:value]

#define NOTIFICATION_LoadLocation                     @"LoadLocation" //重新定位
#define NOTIFICATION_LoadLocationGetResult                     @"NOTIFICATION_LoadLocationGetResult" //拿到定位


#define GET_IMAGEURL(value) [[Singer share] getImageUrlWithStr:value]

#define GET_IMAGEURL_URL(value) [NSURL URLWithString:[[Singer share] getImageUrlWithStr:value]]

#define TokenToolShared [TotalAccessTokenTool shared]

#define ACCESSTOKEN @"ACCESSTOKEN"
#define REFRESHTOKEN @"REFRESHTOKEN"

#define ISLOGIN @"ISLOGIN"

//===============支付宝支付================
#define ALI_PARTNER                                  @"2088121588473913"
#define ALI_SELLTER                                  @"sun@ehfarm.com"
//#define ALI_PRIVATE_KEY                           @"MIICXAIBAAKBgQDVawRp/sUGcLfzwMocq/efnYLmCSgUJp+racyMgXamHApuSP1YCF5Z6BUpxQLTdYGOohYxnQTqJWkeQautXZfB72A2rv/66EHBczwZs6SmQsbp/a/P3S2/tvJ9yF8sppsiRAWOP2b1hg8z5pD5wz1XT2/HBfzjEOzPiFfTtTb0sQIDAQABAoGABa3jYC63b4RwYLwwpLKu1ECMyzJTLrYYaadXGiYX0jPM00J9+2m9mQbkCUiE2ru1xuXpUUisaM62DWgR+XsUHrifTEwDZ+SPP4Kq7QmW6mqf7ZoHWo8J4aqPULS1ky37kaLxaG8e/Jtc5TtT+DL0iZNJ7t471jSFRtG4SQp0+UECQQDqDUGvRVyGOo25uDPyNpgDVIkZqM1cU8AlvMERbWCWOnHhGp+aQIgVwpBTMjJuSIFT7pYuxV4lkRW19XliiA//AkEA6W5rHk4CNFsns0k5pKqIJnErwmtTxE9TdzshHVytAng7LHPUu4wLoDnDP9FX7hiTEnnUC6nzQJJto4sManX7TwJBAOmsWJL75hdhaFQuszY1CWnxwXury3RNbX5/yCZ1FESIj1/V69jear+G4/8cE7uFihFZF/oUNR2+j3V+YjVccNMCQAR2hPvGWApyN7cYzk5UqFe70C9eZ/KX5aug6Mgr7m7ep5r49/dB/TLqB86fjQPTWnR++cvjSvBQHGKFFQ6wBMcCQDTo11SyY+ETmj+uz4aCIt+bDiDvkrc66SF/ICU668HnnINCCOL88IMg0WIG5G6afRO2kustmtC3e97IoqWOPAM="
#define ALI_PRIVATE_KEY                           @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANVrBGn+xQZwt/PAyhyr95+dguYJKBQmn6tpzIyBdqYcCm5I/VgIXlnoFSnFAtN1gY6iFjGdBOolaR5Bq61dl8HvYDau//roQcFzPBmzpKZCxun9r8/dLb+28n3IXyymmyJEBY4/ZvWGDzPmkPnDPVdPb8cF/OMQ7M+IV9O1NvSxAgMBAAECgYAFreNgLrdvhHBgvDCksq7UQIzLMlMuthhpp1caJhfSM8zTQn37ab2ZBuQJSITau7XG5elRSKxozrYNaBH5exQeuJ9MTANn5I8/gqrtCZbqap/tmgdajwnhqo9QtLWTLfuRovFobx78m1zlO1P4MvSJk0nu3jvWNIVG0bhJCnT5QQJBAOoNQa9FXIY6jbm4M/I2mANUiRmozVxTwCW8wRFtYJY6ceEan5pAiBXCkFMyMm5IgVPuli7FXiWRFbX1eWKID/8CQQDpbmseTgI0WyezSTmkqogmcSvCa1PET1N3OyEdXK0CeDssc9S7jAugOcM/0VfuGJMSedQLqfNAkm2jiwxqdftPAkEA6axYkvvmF2FoVC6zNjUJafHBe6vLdE1tfn/IJnUURIiPX9Xr2N5qv4bj/xwTu4WKEVkX+hQ1Hb6PdX5iNVxw0wJABHaE+8ZYCnI3txjOTlSoV7vQL15n8pflq6DoyCvubt6nmvj390H9MuoHzp+NA9NadH75y+NK8FAcYoUVDrAExwJANOjXVLJj4ROaP67PhoIi35sOIO+StzrpIX8gJTrrweecg0II4vzwgyDRYgbkbpp9E7aS6y2a0Ld73siipY48Aw=="

#define ALI_CALLBACK_URL                             @"http://121.42.165.3:8080/farm-api/alinotify"
//=======================================


//static NSString * const ServiceTel = @"4000557525";//客服400电话


#define AppDownLoadUrl @"https://itunes.apple.com/us/app/id961496539?ls=1&mt=8" //appStroe下载该应用信息地址
//appStroe评论该应用信息地址
#define APPCOMMEMTURL @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=961496539"