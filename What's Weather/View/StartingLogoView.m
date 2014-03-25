//
//  StartingLogoView.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-20.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "StartingLogoView.h"
const float ANIMATE_DURATION =1.0;
@implementation StartingLogoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)startAnimation{

    CABasicAnimation *moveUpAnimation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    moveUpAnimation.fromValue=[NSNumber numberWithFloat:0];
    moveUpAnimation.toValue=[NSNumber numberWithFloat:-(self.frame.origin.y+self.frame.size.height)];

    CABasicAnimation *opacityAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue=[NSNumber numberWithFloat:1];
    opacityAnimation.toValue=[NSNumber numberWithFloat:0];
    
    CAAnimationGroup *groupAnimation=[CAAnimationGroup animation];
    groupAnimation.animations=@[moveUpAnimation,opacityAnimation];
    groupAnimation.duration=ANIMATE_DURATION;
    groupAnimation.fillMode=kCAFillModeForwards;
    groupAnimation.removedOnCompletion=NO;
    groupAnimation.delegate=self;
    [groupAnimation setValue:@"logoMove" forKey:@"aniType"];

    [self.layer addAnimation:groupAnimation forKey:nil];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [_delegate didFinishStartingAnimation];
}

@end
