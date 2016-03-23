//
//  WeatherInfoCell.h
//  TheWeatherForecas
//
//  Created by 罗钰慧 on 16/3/23.
//  Copyright (c) 2016年 Naive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherModel.h"

@interface WeatherInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *weatherInfo_lab1;
@property (weak, nonatomic) IBOutlet UILabel *weatherInfo_lab2;
@property (weak, nonatomic) IBOutlet UILabel *weatherInfo_lab3;
@property (weak, nonatomic) IBOutlet UILabel *weatherInfo_lab4;
@property (weak, nonatomic) IBOutlet UILabel *weatherInfo_lab5;
@property (weak, nonatomic) IBOutlet UILabel *weatherInfo_lab6;
@property (weak, nonatomic) IBOutlet UILabel *weatherInfo_lab7;
@property (weak, nonatomic) IBOutlet UILabel *weatherInfo_lab8;

- (void)setWeatherInfoLab:(Today *)model;

@end
