//
//  ForegroundInfo_label.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-25.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "ForegroundInfo_label.h"
#import "UILabel+customize.h"
@interface ForegroundInfo_label()
@property (strong,nonatomic) UIImageView *ico_imageview;
@end
@implementation ForegroundInfo_label

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.icoRect=CGRectMake(0,0, 20, 20);
        self.ico_imageview=[[UIImageView alloc]initWithFrame:self.icoRect];
        self.ico_imageview.image=self.ico_image;
        self.textLabel=[[UILabel alloc]initWithFrame:CGRectMake(28, 3, self.frame.size.width-self.ico_imageview.frame.size.width, self.ico_imageview.frame.size.height)];
        [self.textLabel customizeLabelwithFontName:@"FZZXHJW--GB1-0" fontSize:15 color:[UIColor whiteColor] alignment:NSTextAlignmentLeft];
        [self addSubview:self.ico_imageview];
        [self addSubview:self.textLabel];
    }
    return self;
}
-(void)updateLabelText:(NSString *)labelText{
    self.textLabel.text=labelText;
    [self.textLabel setAutoLabelHeight];
}
-(void)updateLabelIco:(NSString *)icoKey{
    self.ico_imageview.image=[UIImage imageNamed:[NSString stringWithFormat:@"ico_%@",icoKey]];
}

@end
