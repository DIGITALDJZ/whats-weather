//
//  StartingViewController.m
//  What's Weather
//
//  Created by 杯面小王子 on 14-3-20.
//  Copyright (c) 2014年 theLittleLab. All rights reserved.
//

#import "StartingViewController.h"
#import "StartingLogoView.h"
#import "WeatherViewController.h"
@interface StartingViewController ()
@property (weak, nonatomic) IBOutlet StartingLogoView *logoImg;

@end

@implementation StartingViewController

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
    // Do any additional setup after loading the view.
    self.logoImg.delegate=self;
    [self.logoImg startAnimation];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)didFinishStartingAnimation{
    WeatherViewController *weatherController=[self.storyboard instantiateViewControllerWithIdentifier:@"WeatherViewController"];
    //CATransition *animation = [CATransition animation];
    
  //  [animation setDuration:0];
   // [animation setType: kCATransitionFade];
   // [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
   // [self.navigationController.view.layer addAnimation:animation forKey:nil];
    [self.navigationController pushViewController:weatherController animated:NO];

}

@end
