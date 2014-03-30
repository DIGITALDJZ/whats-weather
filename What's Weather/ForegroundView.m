//
//  ForegroundView.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-27.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "ForegroundView.h"

@implementation ForegroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setNeedsDisplay{
    [super setNeedsDisplay];
    for (UIView *view in self.subviews) {
        [view setNeedsDisplay];
    }
}
-(void)setNeedsLayout{
    [super setNeedsLayout];
    for (UIView *view in self.subviews) {
        [view setNeedsLayout];
    }
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
