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

@property (strong,nonatomic) NSMutableArray *viewArray;
@property (strong,nonatomic) UIView *temperatureView;
@property (strong,nonatomic) UILabel *dateLabel;
@property (strong,nonatomic) UILabel *temperatureRange;

-(void)updateCurrentTemperature:(NSInteger)temperature withWeather:(NSString *)weather;
@end
