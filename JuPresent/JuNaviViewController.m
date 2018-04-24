//
//  JuNaviViewController.m
//  JuPresent
//
//  Created by Juvid on 2018/4/24.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuNaviViewController.h"
#import "JuTransitionDelegate.h"

@interface JuNaviViewController ()<UINavigationControllerDelegate>
@property (nonatomic,strong) JuTransitionDelegate *ju_interavtiveDelegete;
@end

@implementation JuNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     _ju_interavtiveDelegete=[JuTransitionDelegate initTransitionDelegate:JuTransitionTypePop gestureDirection:JuInteractiveTransitionGestureDirectionRight vcItem:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)prefersStatusBarHidden{
    return self.topViewController.prefersStatusBarHidden;
}
-(void)juPushViewController:(UIViewController *)viewController{
    self.delegate=viewController;
    [self pushViewController:viewController animated:YES];
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
