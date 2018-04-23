//
//  PushViewController.m
//  JuPresent
//
//  Created by Juvid on 2018/4/20.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "PushViewController.h"
#import "JuNaviTransitioning.h"
#import "JuInteractiveTransition.h"

@interface PushViewController ()
@property (nonatomic,strong) JuInteractiveTransition *ju_interavtive;
@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"自定义push";
    self.view.backgroundColor=[UIColor brownColor];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 80, 30)];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(juTouchNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    _ju_interavtive=[JuInteractiveTransition interactiveTransitionWithTransitionType:JuTransitionTypePop GestureDirection:JuInteractiveTransitionGestureDirectionRight];
    [_ju_interavtive addPanGestureForViewController:self];
    // Do any additional setup after loading the view.
}
-(void)juTouchNext{
    PushViewController *nextVc=[[PushViewController alloc]init];
    self.navigationController.delegate=nextVc;
    [self.navigationController pushViewController:nextVc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {

    return _ju_interavtive.interation?_ju_interavtive:nil;
}
//返回手势过渡管理对象
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    return [JuNaviTransitioning juTransitionType:operation];
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
