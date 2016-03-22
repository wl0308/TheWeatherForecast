//
//  UINavCommonViewController.h
//  CMCCMall
//
//  Created by user on 13-11-14.
//  Copyright (c) 2013年 cmcc. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  展示tabbar通知
 */
extern NSString *kShowTabbarNotification;
/**
 *  隐藏tabbar通知
 */
extern NSString *khideTabbarNotification;

/***************************
 功能描述: 一个模块的图标和名称
 ***************************/
@interface UITabBarCommonView : UIView
@property (nonatomic, strong) UILabel *itemLabel;
@property (nonatomic, strong) UIImageView *itemImage;
@property (nonatomic, strong) UIButton *cupBtn;

- (void)setItemSelected;
- (void)setItemUnSelected;

@end

/*********************************************
 功能描述: 各个模块的底部tabbar功能
 输入:    viewControllers:模块中所需的首个controller
         同tabbar(不能传入navigationController)
         images:各模块正常状态下图片
         selectImages:各模块点中状态下图片
         titles:各模块标签
 输出:   一个可切换的tabbarController
 **********************************************/
@interface UITabbarCommonViewController : UIViewController

@property (nonatomic, strong)NSArray *viewControllers;
@property (nonatomic, strong)NSArray *images;
@property (nonatomic, strong)NSArray *selectImages;
@property (nonatomic, strong)NSArray *titles;

@property (nonatomic, strong)UIView *mTabbarView;    //底部导航
@property (nonatomic, strong)UIView *mContentView;   //内容view

@property (nonatomic, strong)UIViewController *currentController;  //当前显示的controller

@property (nonatomic, assign)NSUInteger currentIndex;  //当前controller的索引
//当前选中controller


- (void)setSelectWithIndex:(NSUInteger)index;


//tabbar隐藏
+ (void)setTabbarViewHidden;

//tabbar展示
+ (void)setTabbarViewShow;



/**
 *  设置角标上的红点
 *
 *  @param indexItem 第几个icon上
 */
-(void)setTabarRedIconWithIndex:(NSInteger )indexItem;
/**
 *  消除指定的红点
 */
-(void)dismissIconWithIndex:(NSInteger )indexItem;

@end
