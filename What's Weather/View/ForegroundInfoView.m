//
//  ForegroundInfoView.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-25.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "ForegroundInfoView.h"
@interface ForegroundInfoView()
@property (strong,nonatomic) UILabel *temperatureLabel;
@end
@implementation ForegroundInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.temperatureView.backgroundColor=[UIColor blueColor];
        self.temperatureView=[[UIView alloc]initWithFrame:CGRectMake(0,0,320,60)];
        self.temperatureLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180,60)];
        //self.temperatureLabel.text=@"11111";
        
        [self.temperatureView addSubview:self.temperatureLabel];
        [self.temperatureLabel customizeLabelwithFontName:@"HelveticaNeue-UltraLight" fontSize:64 color:[UIColor whiteColor] alignment:NSTextAlignmentRight];
        self.dateLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 80, 320, 21)];
        self.temperatureRange=[[UILabel alloc]initWithFrame:CGRectMake(0, 103, 320, 21)];
        [self.dateLabel customizeLabelwithFontName:@"HelveticaNeueLTStd-Th" fontSize:15 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter];
        [self.temperatureRange customizeLabelwithFontName:@"HelveticaNeueLTStd-Th" fontSize:15 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter];
        
        NSMutableArray *viewArray=[[NSMutableArray alloc]initWithObjects:self.temperatureView,self.dateLabel,self.temperatureRange, nil];
        [self addSubview:self.temperatureView];
        for (id view in viewArray) {
            [self addSubview:view];
        }

        //hardcode
        [self updateCurrentTemperature:28 withWeather:@"sunny"];
        [self updateDateLabel];
        [self updateTemperatureRange];
    }
    return self;
}
-(void)updateCurrentTemperature:(NSInteger)temperature withWeather:(NSString *)weather{
    UIImageView *weatherImg=[[UIImageView alloc]initWithFrame:CGRectMake(185, 0, 50, 50)];
    weatherImg.image=[UIImage imageNamed:@"ico_sunny"];
    [self.temperatureView addSubview:weatherImg];
    self.temperatureLabel.text=[NSString stringWithFormat:@"%d°",28];
}
-(void)updateDateLabel{
    self.dateLabel.text=@"9:02 am, Apr 6th, 2014";
}
-(void)updateTemperatureRange{
    self.temperatureRange.text=@"↓18° ↑28°";
}
-(void)updateBackground{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
