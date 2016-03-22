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

@interface WeatherForecastVC () {
    
    UITableView *_tableView;
}

@end

@implementation WeatherForecastVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
//    
//    [self.view addSubview:_tableView];
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"weather_image_6.jpg"]];
//    imageView.image=[UIImage imageNamed:@"荷花开.png"];
    [self.tableView setBackgroundView:imageView];
    self.tableView.backgroundView = imageView;
    
    NSLog(@"tableview");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 7;
    }else if (section == 2) {
        return 1;
    }else if (section == 3) {
        return 1;
    }
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 140;
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
//        [cell setWeatherInfo:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    if (indexPath.section == 1) {
        static NSString *identifier = @"WeatherForecasHeadCell";
        WeatherForecasHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"WeatherForecasHeadCell" owner:self options:nil] firstObject];
        }
        [cell setWeatherInfo:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    if (indexPath.section == 2) {
        static NSString *identifier = @"WeatherTodayInfoCell";
        WeatherTodayInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"WeatherTodayInfoCell" owner:self options:nil] firstObject];
        }
//        [cell setWeatherInfo:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    if (indexPath.section == 3) {
        static NSString *identifier = @"WeatherInfoCell";
        WeatherInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"WeatherInfoCell" owner:self options:nil] firstObject];
        }
        //        [cell setWeatherInfo:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    static NSString *identifier = @"WeatherForecasHeadCell";
    WeatherForecasHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WeatherForecasHeadCell" owner:self options:nil] firstObject];
    }
    [cell setWeatherInfo:indexPath];
    
    return cell;
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
