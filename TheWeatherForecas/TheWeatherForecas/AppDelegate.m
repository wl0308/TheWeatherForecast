//
//  AppDelegate.m
//  TheWeatherForecas
//
//  Created by Naive on 16/3/17.
//  Copyright © 2016年 Naive. All rights reserved.
//

#import "AppDelegate.h"
#import "WeatherForecastVC.h"

BMKMapManager* _mapManager;

static NSString * const BaiduMapAppKey = @"PQrLNb4nPhTp6ZIEg37hRskBIo0wH3e5";//百度地图appkey

@interface AppDelegate ()<BMKGeneralDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    UIWindow *window = [[UIWindow alloc] init];
//    WeatherForecastVC *vc = [[WeatherForecastVC alloc] initWithNibName:@"WeatherForecastVC" bundle:nil];
//    window.rootViewController = vc;
//    
//    [self.window makeKeyAndVisible];
    
    // 要使用百度地图，请先启动BaiduMapManager
    _mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:BaiduMapAppKey generalDelegate:self];
    
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [[BaiduLocationManger share] startLocation];
        NSLog(@"--------%@,%@",[BaiduLocationManger share].latitude,[BaiduLocationManger share].longitude);
    });
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
