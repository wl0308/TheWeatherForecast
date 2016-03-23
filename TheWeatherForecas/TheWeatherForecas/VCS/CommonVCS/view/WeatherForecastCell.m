//
//  WeatherForecastCell.m
//  TheWeatherForecas
//
//  Created by 罗钰慧 on 16/3/22.
//  Copyright (c) 2016年 Naive. All rights reserved.
//

#import "WeatherForecastCell.h"

@implementation WeatherForecastCell

- (void)setWeatherForecast:(WeatherModel *)model {
    
    self.cityName.text = model.result.today.city;
    self.cityWeather.text = model.result.today.weather;
    self.cityTemp.text = model.result.sk.temp;
    self.cityHumidity.text = [NSString  stringWithFormat:@"湿度:%@",model.result.sk.humidity];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
