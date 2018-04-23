//
//  PresentationViewController.m
//  JuPresent
//
//  Created by Juvid on 2018/4/20.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "PresentationViewController.h"
#import "JuPresentationController.h"
@interface PresentationViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation PresentationViewController
- (instancetype)init
{
    if ((self = [super init])) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];

    // Do any additional setup after loading the view.
}


- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    if (presented == self) {
        JuPresentationController *presen = [[JuPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
        [presen setHidssView:^{
            CGFloat windowH = [UIScreen mainScreen].bounds.size.height;
            CGFloat windowW = [UIScreen mainScreen].bounds.size.width;
            [UIView animateWithDuration:0.3 animations:^{
                self.view.frame = CGRectMake(0, windowH , windowW, 300);
            } completion:^(BOOL finished) {
                [self dismissViewControllerAnimated:NO completion:^{
                }];
            }];
        }];
        return presen;
    }
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
