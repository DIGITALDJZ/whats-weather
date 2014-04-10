//
//  ForegroundInfo3View.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-4-1.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "ForegroundInfo3View.h"

@interface ForegroundInfo3View()
@property (strong,nonatomic) UIView *dataView;
@property (strong,nonatomic) NSArray *viewArray;
@property (strong,nonatomic) UILabel *temperatureLabel;
@property (strong,nonatomic) UILabel *timeLabel;
@property (strong,nonatomic) UIImageView *weatherImg;
@property (strong,nonatomic) CircleCollectionView *circleCollectionView;
@end

@implementation ForegroundInfo3View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.dataView=[[UIView alloc]initWithFrame:CGRectMake(0, 10,270,5)];
        self.temperatureLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,6,140, 25)];
        self.timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,35,270,5)];
        
        [self.temperatureLabel customizeLabelwithFontName:@"HelveticaNeueLTStd-Th" fontSize:24 color:[UIColor whiteColor] alignment:NSTextAlignmentRight];
        [self.timeLabel customizeLabelwithFontName:@"HelveticaNeueLTStd-Th" fontSize:15 color:[UIColor whiteColor] alignment:NSTextAlignmentCenter];
        self.weatherImg=[[UIImageView alloc]initWithFrame:CGRectMake(140, 0, 25, 25)];
        
        UIView *circleCollectionModule=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.circleCollectionView=[[CircleCollectionView alloc]initWithFrame:CGRectMake(0, 0, 400, 400) collectionViewLayout:[[CircleLayout alloc]init]];
        self.circleCollectionView.center=CGPointMake(135,270);
        [self.circleCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"TIME_CELL"];
        self.circleCollectionView.delegate=self;
        self.circleCollectionView.dataSource=self;
        self.circleCollectionView.backgroundColor=[UIColor clearColor];
        
        UIImageView *circleBgImgView=[[UIImageView alloc]initWithFrame:CGRectMake(-25,36, 320, 98)];
        circleBgImgView.image=[UIImage imageNamed:@"circle_route"];
        
        [circleCollectionModule addSubview:circleBgImgView];
        [circleCollectionModule addSubview:self.circleCollectionView];
        
        [self.dataView addSubview:self.temperatureLabel];
        [self.dataView addSubview:self.timeLabel];
        [self.dataView addSubview:self.weatherImg];
        
        self.viewArray=@[self.dataView,circleCollectionModule];
        
        [self updateTimeLabel];
        [self updateTemperatureLabel];
        [self updateWeatherImg];

        for (id view in self.viewArray) {
            [self addSubview:view];
        }
    }
    return self;
}
-(void)updateTemperatureLabel{
    self.temperatureLabel.text=@"18°";
}
-(void)updateTimeLabel{
    self.timeLabel.text=@"6:00am";
    [self.timeLabel setAutoLabelHeight];
}
-(void)updateWeatherImg{
    self.weatherImg.image=[UIImage imageNamed:@"time_sunrise"];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"TIME_CELL" forIndexPath:indexPath];
    cell.contentView.layer.cornerRadius = 2.5;
    cell.contentView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:.3];
    if (indexPath.item==0) {
        cell.contentView.backgroundColor=[UIColor colorWithRed:133.0/255.0 green:214.0/255.0 blue:90.0/255.0 alpha:1];
    }
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return 36;
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
