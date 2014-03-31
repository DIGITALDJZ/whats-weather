//
//  ImgCell.h
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-24.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForegroundView.h"
#import "ForegroundInfoView.h"
#import "ForegroundInfo2View.h"
@interface ImgCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property (weak, nonatomic) IBOutlet UIView *foreground;
//@property (weak, nonatomic) IBOutlet UIView *foregroundInfoContainer;

-(void)foregroundViewAdd;

@end
