//
//  WeatherForecasHeadCell.m
//  TheWeatherForecas
//
//  Created by 罗钰慧 on 16/3/22.
//  Copyright (c) 2016年 Naive. All rights reserved.
//

#import "WeatherForecasHeadCell.h"

@implementation WeatherForecasHeadCell

- (void)setWeatherInfo:(NSIndexPath *)indexPath {
    
    //假数据，后期删除
    NSArray *arrWeek = [[NSArray alloc] initWithObjects:@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期天", nil];
    NSArray *arrWeatherImg = [[NSArray alloc] initWithObjects:@"weather_code_day_0.png",@"weather_code_day_1.png",@"weather_code_day_2.png",@"weather_code_day_3.png",@"weather_code_day_4.png",@"weather_code_day_5.png",@"weather_code_day_6.png", nil];
    NSArray *arrWeather = [[NSArray alloc] initWithObjects:@"小雨",@"中雨",@"大雨",@"雷雨",@"晴天",@"多云",@"阴天", nil];
    NSArray *arrHigh = [[NSArray alloc] initWithObjects:@"21",@"11",@"20",@"23",@"25",@"17",@"19", nil];
    NSArray *arrLow = [[NSArray alloc] initWithObjects:@"11",@"9",@"14",@"15",@"17",@"12",@"13", nil];
    
    self.weatherWeek.text = arrWeek[indexPath.row];
    self.weatherImg.image = [UIImage imageNamed:arrWeatherImg[indexPath.row]];
    self.weatherState.text = arrWeather[indexPath.row];
    self.weatherHigh.text = arrHigh[indexPath.row];
    self.weatherLow.text = arrLow[indexPath.row];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
