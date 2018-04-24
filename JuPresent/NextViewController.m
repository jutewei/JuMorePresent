//
//  NextViewController.m
//  JuPresent
//
//  Created by Juvid on 2018/4/20.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "NextViewController.h"
#import "JuModelTransitioning.h"
#import "JuTransitionDelegate.h"
#import "JuInteractiveTransition.h"

@interface NextViewController ()
@property (nonatomic,strong) JuTransitionDelegate *ju_interavtiveDelegete;
@property (nonatomic,strong) JuInteractiveTransition *ju_interavtive;
@end

@implementation NextViewController
-(instancetype)init{
    self=[super init];
    if(self){
//        self.transitioningDelegate = self;
//        self.modalPresentationStyle = UIModalPresentationCustom;
 _ju_interavtiveDelegete=[JuTransitionDelegate initTransitionDelegate:JuTransitionTypeDismiss gestureDirection:JuInteractiveTransitionGestureDirectionDown vcItem:self];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
//    _ju_interavtive=[JuInteractiveTransition interactiveTransitionWithTransitionType:JuTransitionTypeDismiss GestureDirection:JuInteractiveTransitionGestureDirectionDown];
//     [_ju_interavtive addPanGestureForViewController:self];
    //    [_ju_interavtive addPanGestureForViewController:self.navigationController];

//      self.navigationController.delegate = self;
    // Do any additional setup after loading the view.
}
//延迟加载

/*#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [JuModelTransitioning juTransitionType:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
//    self.animator.presented = NO;
    return [JuModelTransitioning juTransitionType:NO];
}
//- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
//    return nil;
//}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    return  nil;
}
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    return nil;
}
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return _ju_interavtive.interation?_ju_interavtive:nil;
}*/
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
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
