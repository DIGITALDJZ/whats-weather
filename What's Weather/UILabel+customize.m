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
    self.backgroundColor=[UIColor clearColor];
    
}
-(void)setAutoLabelHeight
{
    
    CGSize maximumSize = CGSizeMake(self.frame.size.width, 10000);
    CGSize labelHeighSize;
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        labelHeighSize = [self.text sizeWithFont: [UIFont fontWithName:self.font.fontName size:14.0f] constrainedToSize:maximumSize lineBreakMode:NSLineBreakByWordWrapping];
        
        
    }else if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")){
        NSRange range=NSMakeRange(0, self.text.length);
        NSDictionary *dic=[self.attributedText attributesAtIndex:0 effectiveRange:&range];
        labelHeighSize=[self.text boundingRectWithSize:labelHeighSize options:NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    }
    self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, labelHeighSize.height);
    NSLog(@"%f",self.frame.size.height);

}

@end
