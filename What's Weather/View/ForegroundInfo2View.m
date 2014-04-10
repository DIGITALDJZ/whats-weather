//
//  ForegroundInfo2View.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-25.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "ForegroundInfo2View.h"
@interface ForegroundInfo2View()
@property (strong,nonatomic) NSArray *viewArray;
@property (strong,nonatomic) NSMutableArray *infotypes;
@end

@implementation ForegroundInfo2View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       // self.viewArray=[[NSMutableArray alloc]initWithCapacity:4];
        self.infotypes=[[NSMutableArray alloc]initWithObjects:@"wind",@"wet",@"fire",@"pm25", nil];
        UIView *animateView1=[[UIView alloc]initWithFrame:CGRectMake(0, 40, 270, 25)];
        UIView *animateView2=[[UIView alloc]initWithFrame:CGRectMake(0, 80, 270, 25)];
        self.viewArray=@[animateView1,animateView2];
        ForegroundInfo_label *foregroundLabel1=[[ForegroundInfo_label alloc]initWithFrame:CGRectMake(25, 0, 100, 20)];
        ForegroundInfo_label *foregroundLabel2=[[ForegroundInfo_label alloc]initWithFrame:CGRectMake(150, 0, 100, 20)];
        ForegroundInfo_label *foregroundLabel3=[[ForegroundInfo_label alloc]initWithFrame:CGRectMake(25, 0, 100, 20)];
        ForegroundInfo_label *foregroundLabel4=[[ForegroundInfo_label alloc]initWithFrame:CGRectMake(150, 0, 100, 20)];
        NSArray *foregroundLabels=[[NSArray alloc]initWithObjects:foregroundLabel1,foregroundLabel2,foregroundLabel3,foregroundLabel4, nil];
        NSArray *infoNames=@[@"北风3级",@"湿度20%",@"火警2级",@"(PM2.5)优"];
        for (int i=0; i<[self.infotypes count]; i++) {
            NSString *infoTypeStr=self.infotypes[i];
            ForegroundInfo_label *label=(ForegroundInfo_label *)foregroundLabels[i];
            
            label.textLabel.textColor=[UIColor whiteColor];
            [label updateLabelText:infoNames[i]];

            [label updateLabelIco:infoTypeStr];
            
            if (i<2) {
                [animateView1 addSubview:label];
            }else{
                [animateView2 addSubview:label];
            }
        }
        for (id view in self.viewArray) {
            [self addSubview:view];
        }
    }
    return self;
}

-(NSArray *)viewArray{
    if (!_viewArray) {
        _viewArray=[[NSArray alloc]init];
    }
    return _viewArray;
}
@end
