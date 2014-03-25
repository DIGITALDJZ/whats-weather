//
//  StartingLogoView.h
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-20.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol StartingDelegate

-(void)didFinishStartingAnimation;
@end
@interface StartingLogoView : UIImageView
@property (strong) id delegate;
-(void)startAnimation;
@end
