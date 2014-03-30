//
//  ImgCell.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-24.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "ImgCell.h"

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
        // Initialization code
        
    }
    return self;
}

-(void)switchToNextForeground{
    NSInteger currentIndex=0;
    for (currentIndex=0; currentIndex<self.foregroundArray.count; currentIndex++) {
        ForegroundView *view=[self.foregroundArray objectAtIndex:currentIndex];
        if (view.hidden==NO) {
            view.hidden=YES;
            break;
        }
    }
    if (currentIndex==(self.foregroundArray.count-1)) {
        ((ForegroundView *)self.foregroundArray.firstObject).hidden=NO;
    }else{
        ((ForegroundView *)[self.foregroundArray objectAtIndex:(currentIndex+1)]).hidden=NO;
    }
}
-(void)switchToPrevForeground{
    NSInteger currentIndex=0;
    for (currentIndex=0; currentIndex<self.foregroundArray.count; currentIndex++) {
        ForegroundView *view=[self.foregroundArray objectAtIndex:currentIndex];
        if (view.hidden==NO) {
            view.hidden=YES;
            break;
        }
    }
    if (currentIndex==0) {
        ((ForegroundView *)self.foregroundArray.lastObject).hidden=NO;
    }else{
        ((ForegroundView *)[self.foregroundArray objectAtIndex:(currentIndex-1)]).hidden=NO;
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
