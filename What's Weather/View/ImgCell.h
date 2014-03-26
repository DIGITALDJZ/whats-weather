//
//  ImgCell.h
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-24.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *foregroundContainer;
@property (weak, nonatomic) IBOutlet UIImageView *foregroundline;
@property (weak, nonatomic) IBOutlet UIImageView *foregroundImg;
@property (weak, nonatomic) IBOutlet UIButton *foregroundSwitcher_prev;
@property (weak, nonatomic) IBOutlet UIButton *foregroundSwitcher_next;

@end
