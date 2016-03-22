//
//  BasicViewController.m
//  ThailandGo
//
//  Created by Daniel on 15/9/28.
//  Copyright © 2015年 Daniel. All rights reserved.
//

#import "BasicViewController.h"
#import "AppDelegate.h"
//#import "HomeViewController.h"
//#import "RegisterViewController.h"
#import "BoardAndLineButton.h"

//#import "UIViewController+Category.h"
//#import "CallServiceVC.h"
//#import "OrderListViewController.h"
//#import "MyDiscountVC.h"
//#import "ComplaintsSuggestionsVC.h"
//#import "RechargeVC.h"
//#import "GoodsDetailsViewController.h"


@interface BasicViewController () {
//    UIView *view ;
//    UIImageView *backgroundImg;
//    UILabel *titleLabel ;
//    BoardAndLineButton *button;
}

@end

@implementation BasicViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self setTabBarHiddenAction];
    [self showNavBar];
    
 
}

#pragma mark - 自动隐藏底部tabbar
-(void)setTabBarHiddenAction
{
    BasicViewController *control=(BasicViewController *)[self.navigationController.viewControllers firstObject];
    if (![control isKindOfClass:[BasicViewController class]]) {
        return;
    }

    if (control == self) {
        [UITabbarCommonViewController setTabbarViewShow];
    }else{
        [UITabbarCommonViewController setTabbarViewHidden];
    }

}

-(void)showNavBar{
    
    BasicViewController *control=(BasicViewController *)[self.navigationController.viewControllers firstObject];
    
    if (![control isKindOfClass:[BasicViewController class]]) {
        return;
    }

    
//    if (control != [HomeViewController class]) {
        self.navigationController.navigationBar.barTintColor = ORANGE_COLOR;
//    }else{
//        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
//    }
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:WHITE_COLOR,NSForegroundColorAttributeName,nil]];
    
    
    
    
//    if (control == self) {
//        self.navigationController.navigationBar.hidden = YES;
//        
//    }else{
//        self.navigationController.navigationBar.hidden = NO;
//    }
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];

    //返回按钮
    [self setTheBackItemButton];
    
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }

//    if ([UINavigationBar conformsToProtocol:@protocol(UIAppearanceContainer)]) {
//        [UINavigationBar appearance].tintColor = [UIColor whiteColor];
//        [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName : [UIColor whiteColor]}];
//        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(51) / 255.f green:(171) / 255.f blue:(160) / 255.f alpha:1.f]];
//        [[UINavigationBar appearance] setTranslucent:NO];
//    }
    
//    
//    if(IOS7_OR_LATER){
////        if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
//
////            self.edgesForExtendedLayout = UIRectEdgeNone;
//
//
//    }
//    
//    if (IOS7){
//        /**
//         *  当你的容器是navigation controller时，默认的布局将从navigation bar的顶部开始。这就是为什么所有的UI元素都往上漂移了44pt。
//         */
////        self.edgesForExtendedLayout = UIRectEdgeNone;
////        self.extendedLayoutIncludesOpaqueBars = NO;
////        self.modalPresentationCapturesStatusBarAppearance = NO;
//        
//    }
    
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];

    
    
    // Do any additional setup after loading the view.
}



#pragma mark 定义返回按钮
/**
 *   @pragma返回按钮
 */
- (void)setTheBackItemButton
{
    UIImage* backImg;
    //自定义返回按钮
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        
//        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0){
        
            
            if ([self.navigationController.viewControllers count]>1) {
                UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
                backButton.frame = CGRectMake(0.0, 0.0, 40.0, 27.0);
                [backButton setImage:[UIImage imageNamed:@"navBar_BackLeft"] forState:UIControlStateNormal];
                [backButton setImage:[UIImage imageNamed:@"navBar_BackLeft"] forState:UIControlStateSelected];
                [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
                UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
                temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
                self.navigationItem.leftBarButtonItem=temporaryBarButtonItem;
            }
            
            
//        }else{
//            backImg=[[UIImage imageNamed:@"navBar_BackLeft"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)resizingMode:UIImageResizingModeStretch];
//            //        UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
//            //        [bt setBackgroundImage:backImg forState:UIControlStateNormal];
//            //        bt.frame=CGRectMake(0, 0, 25, 25);
//            UIBarButtonItem* backItem=[[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:self action:nil];
//            
//            [backItem setBackButtonBackgroundImage:backImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//            //        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]initWithCustomView:bt];
//            self.navigationItem.backBarButtonItem = backItem;
//            
//        }
        
    }else{
        backImg=[[UIImage imageNamed:@"navBar_Back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 0)resizingMode:UIImageResizingModeStretch];
        UIBarButtonItem* backItem=[[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:self action:nil];
        
        [backItem setBackButtonBackgroundImage:backImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        backItem.enabled=YES;
        self.navigationItem.backBarButtonItem = backItem;
    }
    
}
-(void)backAction
{
    [SVProgressHUD dismiss];
    [[WLNetworkErrorView shared] networkErrorRemove];
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark 弹出登陆页面
-(void)presentLoginVCAction
{
//    if (self.presentingViewController) {
//        [self presentViewController:[RegisterViewController navigationControllerContainSelf] animated:YES completion:nil];
//    }else{
//        if (self.tabbarController) {
//            [self.tabbarController presentViewController:[RegisterViewController navigationControllerContainSelf] animated:YES completion:nil];
//        }else{
//            [self presentViewController:[RegisterViewController navigationControllerContainSelf] animated:YES completion:nil];
//        }
//    }
    
}

#pragma mark - 网络错误
//- (void)networkErrorShow {
//    
//    [view removeFromSuperview];
//    
//    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
//    view.backgroundColor = [UIColor whiteColor];
//    
//    backgroundImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 128, 128)];
//    backgroundImg.image = [UIImage imageNamed:@"discount_empty.png"];
//    backgroundImg.center = CGPointMake(view.center.x, view.center.y-100);
//    [view addSubview:backgroundImg];
//    
//    
//    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
//    titleLabel.center = CGPointMake(view.center.x, backgroundImg.center.y+backgroundImg.size.height);
//    titleLabel.text = @"亲，您的手机网络不太顺畅喔~";
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.font = [UIFont systemFontOfSize:17];
//    titleLabel.textColor = [UIColor grayColor];
//    [view addSubview:titleLabel];
//    
//    button = [[BoardAndLineButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//    button.center = CGPointMake(view.center.x, titleLabel.center.y+titleLabel.size.height);
//    [button setTitle:@"重新加载" forState:UIControlStateNormal];
//    [button setCustomColor:GRAY_COLOR];
//    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        
//        //发送通知
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"buttonClick" object:nil];
//    }];
////    [button setTitleColor:GRAY_COLOR forState:UIControlStateNormal];
//    [view addSubview:button];
//    
//    [self.view addSubview:view];
//}
//
//- (void)networkErrorRemove {
//    [view removeFromSuperview];
//}

#pragma mark - 生鲜客户端 伪协议 定义
/**
 *  1 表示进入FAQ页面  无需参数
 2 表示进入热门页面 无需参数
 3 表示进入今日特价页面 无需参数
 4 表示进入限时抢购页面 无需参数
 5 表示进入我的订单页面 无需参数
 6表示进入到个人中心  无需参数
 7 表示进入到我的优惠券页面 无需参数
 8 表示进入意见反馈页面  无需参数
 9 表示进入充值界面  无需参数
 10表示进入商品详情页 后面接商品编号
 *
 *  @param eventId <#eventId description#>
 *  @param value   <#value description#>
 */
//-(void)actionWithEventId:(NSString *)eventId andValue:(NSString *)value{
//    
//    
//    switch ([eventId integerValue]) {
//        case 1:{
//            NSLog(@"去FAQ");
//            
////            CallServiceVC *vc =[[CallServiceVC alloc] initWithNibName:@"CallServiceVC" bundle:nil];
////            [self.navigationController pushViewController:vc animated:YES];
//            
//            break;
//        }
//        case 2:{
//            NSLog(@"去服务页面");
//            
////            ServicesVC *vc =[[ServicesVC alloc] initWithNibName:@"ServicesVC" bundle:nil];
////            vc.partentId = CHECK_VALUE(value);
////            [self.navigationController pushViewController:vc animated:YES];
//            
//            [[[Singer share] customTabbr] setSelectWithIndex:1];
//            break;
//        }
//        case 3:{
//            NSLog(@"去今日特价页面");
////            TodaySepcVC *vc =[[TodaySepcVC alloc] initWithNibName:@"TodaySepcVC" bundle:nil];
////            [self.navigationController pushViewController:vc animated:YES];
//            [[[Singer share] customTabbr] setSelectWithIndex:1];
//            break;
//        }
//        case 4:{
//            NSLog(@"去优惠搭配页面");
////            MachingDiscountVC *vc =[[MachingDiscountVC alloc] initWithNibName:@"MachingDiscountVC" bundle:nil];
////            [self.navigationController pushViewController:vc animated:YES];
//            [[[Singer share] customTabbr] setSelectWithIndex:1];
//            break;
//        }
//        case 5:{
//            NSLog(@"去我的订单页面");
////            [[Singer share].customTabbr setSelectWithIndex:1];
////            OrderListViewController* viewController = [[OrderListViewController alloc] initWithNibName:@"OrderListViewController" bundle:nil];
//            [self.navigationController pushViewController:viewController animated:YES];
//            
//            break;
//        }
//        case 6:{
//            NSLog(@"去个人中心");
//            [[Singer share].customTabbr setSelectWithIndex:3];
//            break;
//        }
//        case 7:{
//            NSLog(@"去我的优惠券页面");
//            MyDiscountVC *vc =[[MyDiscountVC alloc] initWithNibName:@"MyDiscountVC" bundle:nil];
//            [self.navigationController pushViewController:vc animated:YES];
//            break;
//        }
//        case 8:{
//            NSLog(@"去意见反馈页面");
//            ComplaintsSuggestionsVC *vc =[[ComplaintsSuggestionsVC alloc] initWithNibName:@"ComplaintsSuggestionsVC" bundle:nil];
//            [self.navigationController pushViewController:vc animated:YES];
//            break;
//        }
//        case 9:{
//            NSLog(@"充值界面");
//            RechargeVC *vc =[[RechargeVC alloc] initWithNibName:@"RechargeVC" bundle:nil];
//            [self.navigationController pushViewController:vc animated:YES];
//            break;
//        }
//        case 10:{
//            NSLog(@"商品详情页");
//            GoodsDetailsViewController *vc =[[GoodsDetailsViewController alloc] initWithNibName:@"GoodsDetailsViewController" bundle:nil];
//            vc.goods_id = [NSNumber numberWithInteger:[value integerValue]];
//            [self.navigationController pushViewController:vc animated:YES];
//            
//            break;
//        }
//       
//            
//        
//            
//        default:{
//            NSLog(@"未知");
//        }
//            break;
//    }
//    
//    
//}

-(void)returnUrl:(NSString *)urlpatch EventIdAndValue:(void (^)(NSString *eventId,NSString *value))eventBlock andComwebBlock:(dispatch_block_t)comwebBlcok{
    
    
    NSString *eventNid;
    NSString *valueN;
    
    if ([urlpatch hasPrefix:@"farm:"]) {
        
        NSArray *aryN =[[self getNumByADStr:urlpatch] componentsSeparatedByString:@"/"];
        if (aryN.count==0) {
            
        }else if(aryN.count ==1){
            
            eventNid =[aryN objectAtIndex:0];
            if (eventBlock) {
                eventBlock(eventNid,valueN);
            }
            
        }else if(aryN.count ==2){
            eventNid =[aryN objectAtIndex:0];
            valueN  =[aryN objectAtIndex:1];
            if (eventBlock) {
                eventBlock(eventNid,valueN);
            }
            
        }
    }else if([urlpatch hasPrefix:@"http:"]){
        
        
        if (comwebBlcok) {
            comwebBlcok();
        }
        
    }
}
-(NSString *)getNumByADStr:(NSString*)str{
    
    NSArray *ary =[str componentsSeparatedByString:@"//"];
    NSString *tmp =@"";
    if (ary.count>1) {
        tmp =[ary objectAtIndex:1];
    }
    return tmp ;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
