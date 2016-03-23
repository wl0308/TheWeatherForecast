//
//  WeatherInfoCell.m
//  TheWeatherForecas
//
//  Created by 罗钰慧 on 16/3/23.
//  Copyright (c) 2016年 Naive. All rights reserved.
//

#import "WeatherInfoCell.h"

@implementation WeatherInfoCell

- (void)setWeatherInfoLab:(Today *)model {
    
    self.weatherInfo_lab1.text = model.dressing_index;
    self.weatherInfo_lab2.text = model.dressing_advice;
    self.weatherInfo_lab3.text = model.uv_index;
    self.weatherInfo_lab4.text = model.comfort_index;
    self.weatherInfo_lab5.text = model.travel_index;
    self.weatherInfo_lab6.text = model.exercise_index;
    self.weatherInfo_lab7.text = model.wash_index;
    self.weatherInfo_lab8.text = model.drying_index;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
