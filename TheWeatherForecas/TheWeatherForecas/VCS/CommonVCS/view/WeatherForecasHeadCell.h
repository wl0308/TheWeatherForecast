//
//  WeatherForecasHeadCell.h
//  TheWeatherForecas
//
//  Created by 罗钰慧 on 16/3/22.
//  Copyright (c) 2016年 Naive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherModel.h"

@interface WeatherForecasHeadCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *weatherWeek;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImg;
@property (weak, nonatomic) IBOutlet UILabel *weatherState;
@property (weak, nonatomic) IBOutlet UILabel *weatherHigh;
@property (weak, nonatomic) IBOutlet UILabel *weatherLow;

- (void)setWeatherInfo:(Future *)model;

@end
