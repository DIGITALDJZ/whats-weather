//
//  ForegroundView.h
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-23.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OverallInfoView.h"
@interface ForegroundView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@property (weak, nonatomic) IBOutlet UIView *foregroundContainer;
@end
