//
//  CircleCollectionView.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-4-8.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "CircleCollectionView.h"

@implementation CircleCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    return self;
}
- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        // Initialization code
        CGAffineTransform initRotate=CGAffineTransformMakeRotation(-M_PI_2);
        [self setTransform:initRotate];

    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"aa");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
