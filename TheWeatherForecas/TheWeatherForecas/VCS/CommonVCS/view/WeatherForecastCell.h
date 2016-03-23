//
//  WeatherForecastCell.h
//  TheWeatherForecas
//
//  Created by 罗钰慧 on 16/3/22.
//  Copyright (c) 2016年 Naive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherModel.h"

@interface WeatherForecastCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *cityWeather;
@property (weak, nonatomic) IBOutlet UILabel *cityTemp;
@property (weak, nonatomic) IBOutlet UILabel *cityHumidity;
@property (weak, nonatomic) IBOutlet UIButton *citySelectBtn;
@property (weak, nonatomic) IBOutlet UILabel *weatherTime;

- (void)setWeatherForecast:(WeatherModel *)model;

@end
