//
//  UILabel+customize.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-25.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "UILabel+customize.h"

@implementation UILabel (customize)
-(void)customizeLabelwithFontName:(NSString *)fontName fontSize:(NSInteger)fontSize color:(UIColor *)color alignment:(NSInteger)textAlignment{
    self.textColor=color;
    self.font=[UIFont fontWithName:fontName size:fontSize];
    self.textAlignment=textAlignment;
}
@end
