//
//  ForegroundInfoView.h
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-25.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+customize.h"
@interface ForegroundInfoView : UIView


-(void)updateCurrentTemperature:(NSInteger)temperature withWeather:(NSString *)weather;
-(void)updateDateLabel;
-(void)updateTemperatureRange;

@end
