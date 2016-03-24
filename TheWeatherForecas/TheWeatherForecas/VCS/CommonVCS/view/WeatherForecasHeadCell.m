//
//  WeatherForecasHeadCell.m
//  TheWeatherForecas
//
//  Created by 罗钰慧 on 16/3/22.
//  Copyright (c) 2016年 Naive. All rights reserved.
//

#import "WeatherForecasHeadCell.h"

@implementation WeatherForecasHeadCell

- (void)setWeatherInfo:(Future *)model {
    
    self.weatherWeek.text = model.week;
//    self.weatherImg.image = [UIImage imageNamed:arrWeatherImg[1]];
    self.weatherState.text = model.weather;
    self.weatherHigh.text = model.temperature;
    if ([model.weather_id.fb isEqualToString:@"00"]) {
        weatherImgName = @"weather_code_day_4.png";
    }else if ([model.weather_id.fb isEqualToString:@"01"]) {
        weatherImgName = @"weather_code_day_5.png";
    }else if ([model.weather_id.fb isEqualToString:@"02"]) {
        weatherImgName = @"weather_code_day_6.png";
    }else if ([model.weather_id.fb isEqualToString:@"03"]) {
        weatherImgName = @"weather_code_day_4.png";
    }else if ([model.weather_id.fb isEqualToString:@"04"] || [model.weather_id.fb isEqualToString:@"05"]) {
        weatherImgName = @"weather_code_day_12.png";
    }else if ([model.weather_id.fb isEqualToString:@"06"]) {
        weatherImgName = @"weather_code_day_9.png";
    }else if ([model.weather_id.fb isEqualToString:@"07"] || [model.weather_id.fb isEqualToString:@"08"]) {
        weatherImgName = @"weather_code_day_0.png";
    }else if ([model.weather_id.fb isEqualToString:@"09"]) {
        weatherImgName = @"weather_code_day_1.png";
    }else if ([model.weather_id.fb isEqualToString:@"10"] || [model.weather_id.fb isEqualToString:@"11"] || [model.weather_id.fb isEqualToString:@"12"]) {
        weatherImgName = @"weather_code_day_2.png";
    }else if ([model.weather_id.fb isEqualToString:@"13"] || [model.weather_id.fb isEqualToString:@"14"] || [model.weather_id.fb isEqualToString:@"15"] || [model.weather_id.fb isEqualToString:@"16"] || [model.weather_id.fb isEqualToString:@"17"]) {
        weatherImgName = @"weather_code_day_9.png";
    }else if ([model.weather_id.fb isEqualToString:@"18"] || [model.weather_id.fb isEqualToString:@"19"] || [model.weather_id.fb isEqualToString:@"20"] || [model.weather_id.fb isEqualToString:@"29"] || [model.weather_id.fb isEqualToString:@"30"] || [model.weather_id.fb isEqualToString:@"31"] || [model.weather_id.fb isEqualToString:@"53"]) {
        weatherImgName = @"weather_code_day_10.png";
    }else if ([model.weather_id.fb isEqualToString:@"21"] || [model.weather_id.fb isEqualToString:@"22"] || [model.weather_id.fb isEqualToString:@"23"] || [model.weather_id.fb isEqualToString:@"24"] || [model.weather_id.fb isEqualToString:@"25"]) {
        weatherImgName = @"weather_code_day_1.png";
    }else if ([model.weather_id.fb isEqualToString:@"26"] || [model.weather_id.fb isEqualToString:@"27"] || [model.weather_id.fb isEqualToString:@"28"]) {
        weatherImgName = @"weather_code_day_9.png";
    }
    self.weatherImg.image = [UIImage imageNamed:weatherImgName];
//    self.weatherLow.text = arrLow[indexPath.row];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
