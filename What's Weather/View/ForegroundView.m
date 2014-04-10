//
//  Foreground.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-31.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "ForegroundView.h"
@interface ForegroundView()
@property (strong, nonatomic) UIImageView *foregroundline;
@property (strong, nonatomic) UIImageView *foregroundImg;
@property (strong, nonatomic) UIButton *foregroundSwitcher_prev;
@property (strong, nonatomic) UIButton *foregroundSwitcher_next;
@property (strong, nonatomic) UIView *foregroundInfoContainer;

@property (strong,nonatomic) ForegroundInfoView *foreGroundInfoView;
@property (strong,nonatomic) ForegroundInfo2View *foreGroundInfo2View;
@property (strong,nonatomic) ForegroundInfo3View *foreGroundInfo3View;

@property (strong,nonatomic) NSArray *foregroundArray;
@end
@implementation ForegroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initComponents];
        [self foregroundInfoAdd];
    }
    return self;
}
-(void)initComponents{
    self.foregroundline=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"foreground_line"]];
    self.foregroundline.frame=CGRectMake(0, 0, 320, 4);
    self.foregroundImg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"blue"]];
    self.foregroundImg.frame=CGRectMake(0,4, 320, 136);
    [self addSubview:self.foregroundline];
    [self addSubview:self.foregroundImg];
    
    self.foregroundSwitcher_prev=[UIButton buttonWithType:UIButtonTypeCustom];
    self.foregroundSwitcher_prev.frame=CGRectMake(4, 45, 15, 43);
    [self.foregroundSwitcher_prev setBackgroundImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    [self addSubview:self.foregroundSwitcher_prev];
    
    self.foregroundSwitcher_next=[UIButton buttonWithType:UIButtonTypeCustom];
    self.foregroundSwitcher_next.frame=CGRectMake(300, 45, 15, 43);
    [self.foregroundSwitcher_next setBackgroundImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [self addSubview:self.foregroundSwitcher_next];
    
    self.foregroundInfoContainer=[[UIView alloc]initWithFrame:CGRectMake(25,4,270, 136)];
    [self addSubview:self.foregroundInfoContainer];
    
    [self.foregroundSwitcher_prev addTarget:self action:@selector(switchToPrevForeground) forControlEvents:UIControlEventTouchUpInside];
    [self.foregroundSwitcher_next addTarget:self action:@selector(switchToNextForeground) forControlEvents:UIControlEventTouchUpInside];
}
-(void)foregroundInfoAdd{
    [self.foregroundInfoContainer addSubview:self.foreGroundInfoView];
    [self.foregroundInfoContainer addSubview:self.foreGroundInfo2View];
    [self.foregroundInfoContainer addSubview:self.foreGroundInfo3View];
    self.foregroundArray=@[self.foreGroundInfoView,self.foreGroundInfo2View,self.foreGroundInfo3View];
    
}
-(void)foregroundInfoReset{
    self.foreGroundInfoView.hidden=NO;
    self.foreGroundInfo2View.hidden=YES;
    self.foreGroundInfo3View.hidden=YES;
}
-(ForegroundInfoView *)foreGroundInfoView{
    if (!_foreGroundInfoView) {
        _foreGroundInfoView=[[ForegroundInfoView alloc] initWithFrame:CGRectMake(0, 0, 270, 140)];
    }
    return _foreGroundInfoView;
}
-(ForegroundInfo2View *)foreGroundInfo2View{
    if (!_foreGroundInfo2View) {
        _foreGroundInfo2View=[[ForegroundInfo2View alloc] initWithFrame:CGRectMake(0, 0, 270, 140)];
    }
    return _foreGroundInfo2View;
}
-(ForegroundInfo3View *)foreGroundInfo3View{
    if (!_foreGroundInfo3View) {
        _foreGroundInfo3View=[[ForegroundInfo3View alloc] initWithFrame:CGRectMake(0, 0, 270, 140)];
    }
    return _foreGroundInfo3View;
}
-(NSArray *)foregroundArray{
    if (!_foregroundArray) {
        _foregroundArray=[[NSArray alloc]init];
    }
    return _foregroundArray;
}
-(void)switchToNextForeground{
    NSInteger currentIndex=0;
    for (currentIndex=0; currentIndex<self.foregroundArray.count; currentIndex++) {
        UIView *view=[self.foregroundArray objectAtIndex:currentIndex];
        if (view.hidden==NO) {
            view.hidden=YES;
            break;
        }
    }
    if (currentIndex==(self.foregroundArray.count-1)) {
        ((UIView *)self.foregroundArray.firstObject).hidden=NO;
    }else{
        ((UIView *)[self.foregroundArray objectAtIndex:(currentIndex+1)]).hidden=NO;
    }
}
-(void)switchToPrevForeground{
    NSInteger currentIndex=0;
    for (currentIndex=0; currentIndex<self.foregroundArray.count; currentIndex++) {
        UIView *view=[self.foregroundArray objectAtIndex:currentIndex];
        if (view.hidden==NO) {
            view.hidden=YES;
            break;
        }
    }
    if (currentIndex==0) {
        ((UIView *)self.foregroundArray.lastObject).hidden=NO;
    }else{
        ((UIView *)[self.foregroundArray objectAtIndex:(currentIndex-1)]).hidden=NO;
    }
}
@end
