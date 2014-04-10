//
//  ImgCell.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-24.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "ImgCell.h"
const NSUInteger infoTypeCount =2;
@interface ImgCell()

//@property (strong,nonatomic) ForegroundView *foregroundView;
//@property (weak, nonatomic) IBOutlet UIView *foregroundViewWrap;

@end

@implementation ImgCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        // Initialization codex
        
    }
    return self;
}
/*
-(void)foregroundViewAdd{
    [self.foregroundViewWrap addSubview:self.foregroundView];
    [self.foregroundView foregroundInfoReset];
}
-(ForegroundView *)foregroundView{
    if (!_foregroundView) {
        _foregroundView=[[ForegroundView alloc]initWithFrame:CGRectMake(0, 0, 320, 140)];
    }
    return _foregroundView;
}
 */
@end
