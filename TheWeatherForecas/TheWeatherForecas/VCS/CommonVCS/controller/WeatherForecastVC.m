//
//  WeatherForecastVC.m
//  TheWeatherForecas
//
//  Created by 罗钰慧 on 16/3/22.
//  Copyright (c) 2016年 Naive. All rights reserved.
//

#import "WeatherForecastVC.h"
#import "WeatherForecasHeadCell.h"
#import "WeatherForecastCell.h"
#import "WeatherHeadView.h"
#import "WeatherTodayInfoCell.h"
#import "WeatherInfoCell.h"
#import "WeatherModel.h"
//#import <AFNetworking.h>

static NSString * const WEATHER_KEY = @"af5a3721915b6e3a3016fe694f47b0de";//聚合数据Key

#define JsonFromDic(vaule) [self dictionaryToJson:vaule]

@interface WeatherForecastVC () {
    /**
     *  城市名
     */
    NSString *cityName;
    
//    NSString *key;
    /**
     *  数据源
     */
    WeatherModel *weather_model;
}

@end

@implementation WeatherForecastVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     设置tableView背景图
     */
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"weather_image_6.jpg"]];
    [self.tableView setBackgroundView:imageView];
    self.tableView.backgroundView = imageView;
    
    //隐藏tableView滑动条
    self.tableView.showsVerticalScrollIndicator = NO;
    

//    [SVProgressHUD showWithStatus:@"正在获取当前位置"];
    //延迟操作
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"--------%@,%@",[BaiduLocationManger share].latitude,[BaiduLocationManger share].longitude);
        
        //获取定位的城市名
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        CLGeocodeCompletionHandler handler = ^(NSArray *place,NSError *error) {
            for(CLPlacemark *placeMark in place) {
                cityName = placeMark.locality;
                [self getInfo];
                break;
            }
        };
        CLLocation *loc = [[CLLocation alloc] initWithLatitude:[[BaiduLocationManger share].latitude floatValue] longitude:[[BaiduLocationManger share].longitude floatValue]];
        
        [geocoder reverseGeocodeLocation:loc completionHandler:handler];
    });
    
    
}

/**
 *  请求数据
 */
- (void)getInfo {
//    NSLog(@"%@",cityName);
    [CommonHttpAPI getWeatherInfoWithParameters:[NSString stringWithFormat:@"?format=2&cityname=%@&key=%@",cityName,WEATHER_KEY] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [SVProgressHUD dismiss];
        
        [self dictionaryToJson:responseObject];
        weather_model = [WeatherModel mj_objectWithKeyValues:responseObject];
        
        [self.tableView reloadData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        [SVProgressHUD dismiss];
    }];
}

/**
 *  打印获取的数据呈Json格式
 *
 *  @param dic <#dic description#>
 */
- (void)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    NSLog(@"%@",parseError);
//    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return weather_model.result.future.count;
    }else if (section == 2) {
        return 1;
    }else if (section == 3) {
        return 1;
    }
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 260;
    }
    if (indexPath.section == 1) {
        return 30;
    }
    if (indexPath.section == 2) {
        return 44;
    }
    if (indexPath.section == 3) {
        return 300;
    }
    return 30;
}

-(void)tableView:(UITableView*)tableView  willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 1) {
        return 30;
    }
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 1) {
        
        
        WeatherHeadView *view = [[[NSBundle mainBundle] loadNibNamed:@"WeatherHeadView" owner:self options:nil] firstObject];
        
        view.weatherHead_lbl.text = @"天气预报";
        view.backgroundColor = [UIColor clearColor];
        
        return view;
        
    }
    
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (indexPath.section == 0) {
        static NSString *identifier = @"WeatherForecastCell";
        WeatherForecastCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"WeatherForecastCell" owner:self options:nil] firstObject];
        }
        [cell setWeatherForecast:weather_model];
        [[cell.citySelectBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"城市选择" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
            UITextField *field = [alertView textFieldAtIndex:0];
            field.placeholder = @"请输入查询的城市";
            [alertView show];
        }];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    if (indexPath.section == 1) {
        static NSString *identifier = @"WeatherForecasHeadCell";
        WeatherForecasHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"WeatherForecasHeadCell" owner:self options:nil] firstObject];
        }
        [cell setWeatherInfo:weather_model.result.future[indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    if (indexPath.section == 2) {
        static NSString *identifier = @"WeatherTodayInfoCell";
        WeatherTodayInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"WeatherTodayInfoCell" owner:self options:nil] firstObject];
        }
        cell.weatherInfo_lbl.text = [NSString stringWithFormat:@"今天：%@。当前气温%@",weather_model.result.today.weather,weather_model.result.sk.temp];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    if (indexPath.section == 3) {
        static NSString *identifier = @"WeatherInfoCell";
        WeatherInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"WeatherInfoCell" owner:self options:nil] firstObject];
        }
        [cell setWeatherInfoLab:weather_model.result.today];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    return nil;
}

#pragma mark -UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == alertView.firstOtherButtonIndex) {
        UITextField *field = [alertView textFieldAtIndex:0];
        NSLog(@"%@",field.text);
        if ([field.text isEqualToString:@""]) {
            [SVProgressHUD showErrorWithStatus:@"回复内容不能为空"];
        }else {
            cityName = field.text;
            [self getInfo];
        }
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
