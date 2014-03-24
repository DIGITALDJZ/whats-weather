//
//  StartingSegue.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-20.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "StartingSegue.h"

@implementation StartingSegue

-(void)perform{
    // 触发Segue的ViewController
    UIViewController * svc = (UIViewController *)self.sourceViewController;
    // 目标Segue的ViewController
    UIViewController * dvc = (UIViewController *)self.destinationViewController;
    // 为两个View的切换设置动画效果
    [UIView transitionFromView:svc.view toView:dvc.view duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve completion:nil];
}

@end
