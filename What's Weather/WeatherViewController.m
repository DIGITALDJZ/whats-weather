//
//  ViewController.m
//  BTGlassScrollViewExample
//
//  Created by Byte on 10/18/13.
//  Copyright (c) 2013 Byte. All rights reserved.
//

#define SIMPLE_SAMPLE NO


#import "WeatherViewController.h"

@interface WeatherViewController ()
@property (weak, nonatomic) IBOutlet UIView *topbarView;
@property (weak, nonatomic) IBOutlet UILabel *topbarTitle;
@property (strong,nonatomic) NSMutableArray *imgArray;
@property (strong,nonatomic) UICollectionViewTransitionLayout *transitionLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *locationCollection;
@end

@implementation WeatherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addTopbarIco];
    [self.view bringSubviewToFront:self.topbarView];
    self.imgArray=[[NSMutableArray alloc]initWithArray:@[[UIImage imageNamed:@"yunnan.jpg"],[UIImage imageNamed:@"daocheng.jpg"],[UIImage imageNamed:@"shanghai.jpg"]]];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self viewWillAppear:YES];
}
- (void)setAutomaticallyAdjustsScrollViewInsets:(BOOL)automaticallyAdjustsScrollViewInsets

{
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0){
        
        [super setAutomaticallyAdjustsScrollViewInsets:automaticallyAdjustsScrollViewInsets];
        
    }
    
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section{
    return [self.imgArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // Register nib file for the cell
    ImgCell *imgCell=[cv dequeueReusableCellWithReuseIdentifier:@"imgCell" forIndexPath:indexPath];
    imgCell.imageView.image =[self.imgArray objectAtIndex:indexPath.row];
    return imgCell;

}
-(void)addTopbarIco{
    //待优化
    NSString *str=self.topbarTitle.text;
    self.topbarTitle.font=[UIFont fontWithName:@"FZZXHJW--GB1-0" size:14];
    float strWidth=14*str.length;
    UIImageView *topbar_icoLocation=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_location.png"]];
    topbar_icoLocation.frame=CGRectMake(0, 0, 20, 20);

    topbar_icoLocation.frame=CGRectMake(self.topbarTitle.center.x-strWidth/2-20,14,20,20);
    [self.topbarView addSubview:topbar_icoLocation];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSIndexPath *indexPath=[self.locationCollection indexPathsForVisibleItems].firstObject;
}
@end