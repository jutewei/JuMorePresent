//
//  ViewController.m
//  JuPresent
//
//  Created by Juvid on 2018/4/8.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "PushViewController.h"
#import "SimpleViewController.h"
#import "PresentationViewController.h"
#import "JuNaviTransitioning.h"

#import "JuTransitionDelegate.h"

@interface ViewController ()
@property (nonatomic,strong) JuTransitionDelegate *ju_interavtive;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(BOOL)prefersStatusBarHidden{
    return NO;
}
- (IBAction)juTouchNext:(id)sender {
    NextViewController *nextVc=[[NextViewController alloc]init];
    [self presentViewController:nextVc animated:YES completion:nil];
}
- (IBAction)juTouchPush:(id)sender {

    PushViewController *nextVc=[[PushViewController alloc]init];
//    self.navigationController.delegate=nextVc;

    
    [self.navigationController pushViewController:nextVc animated:YES];
}
- (IBAction)juTouchSimple:(id)sender {
    SimpleViewController *dst = [[SimpleViewController alloc]init];
    // <第一种
    //    [UIView transitionWithView:self.navigationController.view
    //                      duration:0.6
    //                       options:UIViewAnimationOptionTransitionFlipFromBottom
    //                    animations:^{
    //                        [self.navigationController pushViewController:dst animated:NO];
    //                    }
    //                    completion:nil];
    //< 第二种
    [UIView transitionFromView:self.view toView:dst.view duration:1 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
        [self.navigationController pushViewController:dst animated:NO];
    }];

    ///< 第三种
    //    CATransition *transition = [CATransition animation];
    //    transition.duration = 0.3f;
    //    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //    transition.type = kCATransitionPush;
    //    transition.subtype = kCATransitionFromRight;
    //    [self.navigationController.view.layer addAnimation:transition forKey:nil];
}
- (IBAction)juTouchPresentation:(id)sender {
    PresentationViewController *testVC = [[PresentationViewController alloc] init];
    [self presentViewController:testVC animated:YES completion:^{
        NSLog(@"完成");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
