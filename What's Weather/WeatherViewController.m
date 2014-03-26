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

@property (strong,nonatomic) NSArray *foregroundArray;

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
    self.locationCollection.frame=CGRectMake(0, 0, 320, SCREEN_SIZE.height);

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
    imgCell.frame=CGRectMake(imgCell.frame.origin.x,imgCell.frame.origin.y, SCREEN_SIZE.width, SCREEN_SIZE.height);
    imgCell.imageView.image =[self.imgArray objectAtIndex:indexPath.row];
    
    ForegroundInfoView *foreGroundInfoView=[[ForegroundInfoView alloc]initWithFrame:CGRectMake(0, 0, 320, 140)];
    [imgCell.foregroundContainer addSubview:foreGroundInfoView];
    
    ForegroundInfo2View *foreGroundInfo2View=[[ForegroundInfo2View alloc]initWithFrame:CGRectMake(0, 0, 320, 140)];
    [imgCell.foregroundContainer addSubview:foreGroundInfo2View];
    foreGroundInfo2View.hidden=YES;
    
    self.foregroundArray=@[foreGroundInfoView,foreGroundInfo2View];
    
    [imgCell.foregroundContainer bringSubviewToFront:imgCell.foregroundSwitcher_prev];
    [imgCell.foregroundContainer bringSubviewToFront:imgCell.foregroundSwitcher_next];
    
    [imgCell.foregroundSwitcher_prev addTarget:self action:@selector(switchToPrev) forControlEvents:UIControlEventTouchUpInside];
    [imgCell.foregroundSwitcher_next addTarget:self action:@selector(switchToNext) forControlEvents:UIControlEventTouchUpInside];

    return imgCell;

}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SCREEN_SIZE.width, SCREEN_SIZE.height);
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
    //NSIndexPath *indexPath=[self.locationCollection indexPathsForVisibleItems].firstObject;
}

- (void)switchToPrev{
    NSInteger currentIndex=[self getCurrentForeground];
    if (currentIndex==0) {
        ((UIView *)self.foregroundArray.lastObject).hidden=NO;
    }else{
        ((UIView *)[self.foregroundArray objectAtIndex:(currentIndex-1)]).hidden=NO;
    }
    
}

- (void)switchToNext{
    NSInteger currentIndex=[self getCurrentForeground];
    if (currentIndex==([self.foregroundArray count]-1)) {
        ((UIView *)self.foregroundArray.firstObject).hidden=NO;
    }else{
        ((UIView *)[self.foregroundArray objectAtIndex:(currentIndex+1)]).hidden=NO;
    }
}
-(NSInteger)getCurrentForeground{
    NSInteger currentIndex;
    for (currentIndex=0; currentIndex<self.foregroundArray.count; currentIndex++) {
        UIView *view=[self.foregroundArray objectAtIndex:currentIndex];
        if (view.hidden==NO) {
            break;
        }
    }
    for (UIView *view in self.foregroundArray) {
        view.hidden=YES;
    }

    return currentIndex;
}
@end
