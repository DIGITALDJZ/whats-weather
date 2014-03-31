//
//  ForegroundInfo_label.h
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-25.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForegroundInfo_label : UIView

@property (strong,nonatomic) UIImage *ico_image;
@property (strong,nonatomic) UILabel *textLabel;
@property (nonatomic) CGRect icoRect;

-(void)updateLabelText:(NSString *)labelText;
-(void)updateLabelIco:(NSString *)icoKey;
@end
