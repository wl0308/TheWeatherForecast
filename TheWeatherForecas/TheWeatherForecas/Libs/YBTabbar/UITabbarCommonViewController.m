//
//  UITabbarCommonViewController.m
//  CMCCMall
//
//  Created by user on 13-11-14.
//  Copyright (c) 2013年 cmcc. All rights reserved.
//

#import "UITabbarCommonViewController.h"
/**
 *  底部导航每个小图片的大家  默认长宽一样 正方向
 *
 */
#define ITEM_IMAGE_HEIGHT 22

NSString *kShowTabbarNotification=@"BTShowTabbarNotification";

NSString *khideTabbarNotification=@"BTHideTabbarNotification";

@interface UITabBarCommonView()
{
    UIImage *mSlImage;//点击后的图片
    UIImage *mUnSImage;//没点击的图片
    
}

@end

@implementation UITabBarCommonView
/**
 *  UITabBarCommonView 的初始化 代表每一个小按钮  有图片 label  和uibutton 一同组成
 *
 */
- (id)initWithFrame:(CGRect)frame ItemImage:(UIImage *)mImage selectItemImage:(UIImage *)slImage itemTitle:(NSString*)mTitle
{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = frame.size.width;
        //底部view  长条的 SCREEN_SIZE.width长的那个
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        bgView.backgroundColor  =[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.9];
        
        [self addSubview:bgView];
        
        //item图片
        _itemImage = [[UIImageView alloc]initWithFrame:CGRectMake((width - ITEM_IMAGE_HEIGHT)/2, 2, ITEM_IMAGE_HEIGHT, ITEM_IMAGE_HEIGHT)];
        [_itemImage setImage:mImage];
        [bgView addSubview:_itemImage];
        
        //item名称
        _itemLabel = [[UILabel alloc]initWithFrame:CGRectMake((width - 100)/2, 27, 100, 20)];
        [_itemLabel setText:mTitle];
        [_itemLabel setFont:[UIFont systemFontOfSize:11]];
        [_itemLabel setTextAlignment:NSTextAlignmentCenter];
        [_itemLabel setBackgroundColor:[UIColor clearColor]];
        [_itemLabel setTextColor:[UIColor whiteColor]];
        [bgView addSubview:_itemLabel];
        
        //覆盖button  不加没点击事件
        _cupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cupBtn setFrame:CGRectMake(bgView.bounds.origin.x+5, bgView.bounds.origin.y+25, bgView.bounds.size.width, bgView.bounds.size.height)  ];
        [_cupBtn setFrame:bgView.bounds];
        
        [bgView addSubview:_cupBtn];
        
        mSlImage = slImage;
        mUnSImage = mImage;
        
        
    }
    return self;
}
/**
 *  设置label 点击后的颜色
 */
- (void)setItemSelected
{
    [_itemImage setImage:mSlImage];
    [_itemLabel setTextColor:ORANGE_COLOR];
}
/**
 *  设置label 没点击的颜色
 */
- (void)setItemUnSelected
{
    [_itemImage setImage:mUnSImage];
    [_itemLabel setTextColor:[UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1]];
}

@end

@interface UITabbarCommonViewController ()
{
    //保存tabbaritem
    NSMutableArray *itemArys;
    
    UIView *contentView;
    
    NSUInteger selectindex;//记录之前选了第几个tabbar
    NSUInteger selectindexNow;//记录当前选了第几个tabbar
}

@end

@implementation UITabbarCommonViewController

@synthesize mTabbarView;
@synthesize mContentView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.viewControllers.count == self.images.count && self.viewControllers.count == self.titles.count) {
        itemArys = [[NSMutableArray alloc]initWithCapacity:self.viewControllers.count];
        [self setUpTabBar];
        //默认选中
        [self setSelectWithIndex:0];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTabbarViewHidden) name:khideTabbarNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTabbarViewShow) name:kShowTabbarNotification object:nil];
    }
    // Do any additional setup after loading the view from its nib.
}

//tabbar View  SCREEN_SIZE.width长的那个       UITabBarCommonView 是小的那个
- (void)setUpTabBar
{
    //内容view
    UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 1)];
    label.backgroundColor =[UIColor colorWithRed:217/255.0f green:217/255.0f blue:217/255.0f alpha:1];
    UIImageView *imgeLine =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 0.5)];
    imgeLine.backgroundColor =[UIColor colorWithRed:217/255.0f green:217/255.0f blue:217/255.0f alpha:1];
    
    
    //    [self.view addSubview:label];
    
    contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height - TABBAR_HEIGHT - 20)];
    contentView.backgroundColor = [UIColor clearColor];
    self.mContentView = contentView;
    [self.view addSubview:mContentView];
    
    
    //    [mContentView addSubview:label];
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_SIZE.height - TABBAR_HEIGHT - 20, SCREEN_SIZE.width, TABBAR_HEIGHT)];
    //解决ios7中tabbar20像素的问题
    if (IOS7) {
        [backView setFrame:CGRectMake(0, SCREEN_SIZE.height - TABBAR_HEIGHT, SCREEN_SIZE.width, TABBAR_HEIGHT)];
        CGRect cFrame = contentView.frame;
        cFrame.size.height += 20;
        contentView.frame = cFrame;
    }
    self.mTabbarView = backView;
    self.mTabbarView.backgroundColor =[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1];
    
    
    
    [self.view addSubview:mTabbarView];
    
    [self.mTabbarView addSubview:imgeLine];
    
    //item背景
    //    UIImageView *bgImageV = [[UIImageView alloc]initWithFrame:backView.bounds];
    //    [bgImageV setImage:[UIImage imageWithContentFileName:@"new_tab_bg.png"]];
    //    [backView addSubview:bgImageV];
    
    UIImageView *bgImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, backView.bounds.size.width, 0.5)];
    [bgImageV setBackgroundColor:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.9]];
    //    [backView addSubview:bgImageV];
    //    [backView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageWithContentFileName:@"new_tab_bg.png"]]];
    
    for (int i = 0; i < [self.images count]; i++) {
        UIImage *image = [self.images objectAtIndex:i];
        UIImage *sImage = [self.selectImages objectAtIndex:i];
        NSString *title = [self.titles objectAtIndex:i];
        
        CGFloat width = SCREEN_SIZE.width / self.images.count;
        UITabBarCommonView *tabItem = [[UITabBarCommonView alloc]initWithFrame:CGRectMake(width * i, 5, width, TABBAR_HEIGHT) ItemImage:image selectItemImage:sImage itemTitle:title];
        tabItem.tag = i+4000;
        [tabItem.cupBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        tabItem.cupBtn.tag  = i;
        [backView addSubview:tabItem];
        [itemArys addObject:tabItem];
        
        
        
    }
    
    //非左边导航进入该页面,并且显示导航栏，则需要重新适配高度和位置
    //    if (isNotFromLeftMenu)
    //    {
    //
    //        contentView.frame=CGRectMake(contentView.frame.origin.x, contentView.frame.origin.y, contentView.frame.size.width, contentView.frame.size.height-44);
    //        mTabbarView.frame=CGRectMake(mTabbarView.frame.origin.x, mTabbarView.frame.origin.y-44, mTabbarView.frame.size.width, mTabbarView.frame.size.height);
    //
    //        if (IOS7)
    //        {
    //            contentView.frame=CGRectMake(contentView.frame.origin.x, contentView.frame.origin.y, contentView.frame.size.width, contentView.frame.size.height-20);
    //            mTabbarView.frame=CGRectMake(mTabbarView.frame.origin.x, mTabbarView.frame.origin.y-20, mTabbarView.frame.size.width, mTabbarView.frame.size.height);
    //        }
    //    }
    //end
}



//选中的index
- (void)setSelectWithIndex:(NSUInteger)index
{
    selectindexNow =index;
    self.title =[self.titles objectAtIndex:index];
    
    //此项目特殊 只有第一个亮  所以 setTheTitleWithIndex   setSelectItemWithIndex设为0 就行  add by yebin
    
    if ([self.viewControllers count] > index) {
        self.currentIndex=index;
        
        [self setTheTitleWithIndex:index];
        [self setSelectItemWithIndex:index];
        [self setContentViewWithIndex:index];
        selectindex =index;
    }
    
}

//设置title
- (void)setTheTitleWithIndex:(NSInteger)index
{
    //    UIViewController *controller = [self.viewControllers objectAtIndex:index];
    //    if (![self whetherTheMainListVC:controller]) {
    //        [self setTitle:[self.titles objectAtIndex:index]];
    //    }
    //    else{
    //        self.title = @"";
    //    }
}

//设置controller的view
- (void)setContentViewWithIndex:(NSInteger)index
{
    
    if ([self.viewControllers count] > index) {
        for (UIView *view in [contentView subviews]) {
            [view removeFromSuperview];
        }
        UINavigationController *controller = [self.viewControllers objectAtIndex:index];
        if ([controller isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController *)controller popToRootViewControllerAnimated:NO];
        }
        
        [controller.view setFrame:contentView.bounds];
        if (index ==0) {
            
            [controller.view setFrame:CGRectMake(0, 0, contentView.bounds.size.width, contentView.bounds.size.height)];
            
        }
        self.currentController = controller;

        [contentView addSubview:controller.view];
    }
    //    //添加跳动动画
    //    UIView *view=[self.view viewWithTag:index+4000];
    //
    //    [UIView animateWithDuration:0.1 animations:
    //     ^(void){
    //
    //         view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.5, 0.5);
    //
    //
    //     } completion:^(BOOL finished){//do other thing
    //         [UIView animateWithDuration:0.2 animations:
    //          ^(void){
    //
    //              view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.1, 1.1);
    //
    //          } completion:^(BOOL finished){//do other thing
    //              [UIView animateWithDuration:0.1 animations:
    //               ^(void){
    //
    //                   view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
    //
    //
    //               } completion:^(BOOL finished){//do other thing
    //               }];
    //          }];
    //     }];
    
}

//设置tabbar点中效果
- (void)setSelectItemWithIndex:(NSUInteger)index
{
    
    
    if ([itemArys count] > index) {
        for (int i = 0; i < [itemArys count]; i++) {
            UITabBarCommonView *item = [itemArys objectAtIndex:i];
            if (i == index) {
                [item setItemSelected];
            }
            else{
                [item setItemUnSelected];
            }
        }
    }
}

- (void)btnClick:(id)sender
{
    UIButton *button = (UIButton *)sender;
    [self setSelectWithIndex:button.tag];
    
}
//设置底部tabbar隐藏
+ (void)setTabbarViewHidden
{
    
    UITabbarCommonViewController *controller =(UITabbarCommonViewController *)[Singer share].customTabbr;
    if (![controller isKindOfClass:[UITabbarCommonViewController class]]) {
        return;
    }
    
    
    CGRect rect = controller.mTabbarView.frame;
    
    [UIView animateWithDuration:0.5 animations:^{

        controller.mTabbarView.frame = CGRectMake(0, SCREEN_H+rect.size.height, SCREEN_W, rect.size.height);
        
    } completion:^(BOOL finished) {
        
        [controller.mTabbarView setHidden:YES];
    }];
    
    CGRect cFrame = controller.mContentView.frame;
    
    //判断mContentView的高度是否等于屏幕高度，如果等于就返回，不等于就加Tabbar高度
    if (IOS7&&cFrame.size.height==SCREEN_SIZE.height) {
        
        return;
        
    }
    if (!IOS7&&cFrame.size.height==SCREEN_SIZE.height-20) {
        return;
    }
    cFrame.size.height += TABBAR_HEIGHT;
    controller.mContentView.frame = cFrame;
    
}

//设置底部tabbar显示
+ (void)setTabbarViewShow
{
    
    UITabbarCommonViewController *controller=(UITabbarCommonViewController *) [Singer share].customTabbr;
    if (![controller isKindOfClass:[UITabbarCommonViewController class]]) {
        return;
    }
    
    [controller.mTabbarView setHidden:NO];

    CGRect rect = controller.mTabbarView.frame;

    controller.mTabbarView.frame = CGRectMake(0, SCREEN_H-rect.size.height, SCREEN_W, rect.size.height);
    
    CGRect cFrame = controller.mContentView.frame;
    
    //判断mContentView的高度是否等于屏幕高度，如果不等于就返回，等于就减去Tabbar高度
    if (IOS7&&cFrame.size.height!=SCREEN_SIZE.height) {
        return;
    }
    if (!IOS7&&cFrame.size.height!=SCREEN_SIZE.height-20) {
        return;
    }
    cFrame.size.height -= TABBAR_HEIGHT;
    controller.mContentView.frame = cFrame;
}

-(void)setTabarRedIconWithIndex:(NSInteger )indexItem{
    
    if ([[self.mTabbarView superview] viewWithTag:99999+indexItem]) {
        
    }else{
        UIView *iconView =[[UIView alloc] initWithFrame:CGRectMake(55.0f/80.0f*(SCREEN_SIZE.width/5)+SCREEN_SIZE.width/5*(indexItem) , 5, 8, 8)];
        iconView.tag =indexItem+99999;
        iconView.layer.masksToBounds =YES;
        iconView.layer.cornerRadius =8.0f/2;
        
        iconView.backgroundColor =ORANGE_COLOR;
        [self.mTabbarView addSubview:iconView];
    }
    
    
    
}
//消除红色角标
-(void)dismissIconWithIndex:(NSInteger )indexItem{
    
    [self.mTabbarView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if ([obj class]  ==[UIView class]) {
            if (((UIView *)obj).tag ==99999+indexItem) {
                [((UIView *)obj) removeFromSuperview];
            }
            
            
        }
    }];
    
    
}


////设置底部tabbar隐藏
//- (void)setTabbarViewHidden
//{
//    [self.mTabbarView setHidden:YES];
//
//    CGRect cFrame = self.mContentView.frame;
//
//    //判断mContentView的高度是否等于屏幕高度，如果等于就返回，不等于就加Tabbar高度
//    if (IOS7&&cFrame.size.height==SCREEN_SIZE.height) {
//
//        return;
//
//    }
//    if (!IOS7&&cFrame.size.height==SCREEN_SIZE.height-20) {
//        return;
//    }
//    NSLog(@"%f----%f",cFrame.size.height,SCREEN_SIZE.height);
//
//    cFrame.size.height += TABBAR_HEIGHT;
//
//    self.mContentView.frame = cFrame;
//
//     NSLog(@"%@",[contentView subviews]);
//
//     [self.currentController.view setFrame:cFrame];
//
//}
//- (void)setTabbarViewHiddenNew{
//
//    [self.mTabbarView setHidden:YES];
//
//}
////设置底部tabbar显示
//- (void)setTabbarViewShow
//{
//
//
//    [self.mTabbarView setHidden:NO];
//    CGRect cFrame = self.mContentView.frame;
//
//    //判断mContentView的高度是否等于屏幕高度，如果不等于就返回，等于就减去Tabbar高度
//    if (IOS7&&cFrame.size.height!=SCREEN_SIZE.height) {
//        return;
//    }
//    if (!IOS7&&cFrame.size.height!=SCREEN_SIZE.height-20) {
//        return;
//    }
//    cFrame.size.height -= TABBAR_HEIGHT;
//    self.mContentView.frame = cFrame;
//
//     NSLog(@"%@",[contentView subviews]);
//
//     [self.currentController.view setFrame:cFrame];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
