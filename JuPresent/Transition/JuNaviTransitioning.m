//
//  JuNaviTransitioning.m
//  JuPresent
//
//  Created by Juvid on 2018/4/20.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuNaviTransitioning.h"

@implementation JuNaviTransitioning

+(JuNaviTransitioning *)juTransitionType:(UINavigationControllerOperation)operation{
    JuNaviTransitioning *trans=[[JuNaviTransitioning alloc]init];
    trans.push  =operation==UINavigationControllerOperationPush;
    return trans;
}
// 指定动画的持续时长
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.35;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.isPush) {
        [self juPushAnimation:transitionContext];
    }else{
        [self juPopAnimation:transitionContext];
    }
}
//实现present动画逻辑代码
- (void)juPushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    //通过viewControllerForKey取出转场前后的两个控制器，这里toVC就是vc1、fromVC就是vc2
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    //snapshotViewAfterScreenUpdates可以对某个视图截图，我们采用对这个截图做动画代替直接对vc1做动画，因为在手势过渡中直接使用vc1动画会和手势有冲突， 如果不需要实现手势的话，就可以不是用截图视图了，大家可以自行尝试一下
//    UIView *tempView = [fromView snapshotViewAfterScreenUpdates:NO];
//    tempView.frame = fromView.frame;
    //因为对截图做动画，vc1就可以隐藏了
    //    fromView.hidden = YES;
    //这里有个重要的概念containerView，如果要对视图做转场动画，视图就必须要加入containerView中才能进行，可以理解containerView管理着所有做转场动画的视图
    UIView *containerView = [transitionContext containerView];
    //将截图视图和vc2的view都加入ContainerView中
//    [containerView addSubview:tempView];
    [containerView addSubview:toView];
    //设置vc2的frame，因为这里vc2present出来不是全屏，且初始的时候在底部，如果不设置frame的话默认就是整个屏幕咯，这里containerView的frame就是整个屏幕
    toView.frame = CGRectMake(containerView.frame.size.width,  0, containerView.frame.size.width, containerView.frame.size.height);
    [self juSetShowWithView:toView];
    //开始动画吧，使用产生弹簧效果的动画API
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0  options:0 animations:^{
        //首先我们让vc2向上移动
        //        toView.transform = CGAffineTransformMakeTranslation(-containerView.frame.size.width, 0);
        toView.frame = CGRectMake(0,  0, containerView.frame.size.width, containerView.frame.size.height);
        fromView.frame =CGRectMake(-containerView.frame.size.width/6,  0, containerView.frame.size.width, containerView.frame.size.height);
//        fromView.transform = CGAffineTransformMakeTranslation(-containerView.frame.size.width/6, 0);
        //然后让截图视图缩小一点即可
    } completion:^(BOOL finished) {
//        [tempView removeFromSuperview];
        //使用如下代码标记整个转场过程是否正常完成[transitionContext transitionWasCancelled]代表手势是否取消了，如果取消了就传NO表示转场失败，反之亦然，如果不用手势present的话直接传YES也是可以的，但是无论如何我们都必须标记转场的状态，系统才知道处理转场后的操作，否者认为你一直还在转场中，会出现无法交互的情况，切记！
        [transitionContext completeTransition:YES];
        //转场失败后的处理
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }
    }];
}

//实现dismiss动画逻辑代码
- (void)juPopAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    //注意在dismiss的时候fromVC就是vc2了，toVC才是VC1了，注意这个关系
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    //参照push动画的逻辑，push成功后，containerView的最后一个子视图就是截图视图，我们将其取出准备动画
    UIView *tempView = containerView.subviews.lastObject;

//    [containerView addSubview:toVC.view];
     [containerView insertSubview:toVC.view belowSubview:tempView];
//    [containerView addSubview:tempView];
    toVC.view.frame =CGRectMake(-containerView.frame.size.width/6,  0, containerView.frame.size.width, containerView.frame.size.height);
    //动画吧
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        //因为present的时候都是使用的transform，这里的动画只需要将transform恢复就可以了
        fromVC.view.frame = CGRectMake(containerView.frame.size.width,  0, containerView.frame.size.width, containerView.frame.size.height);
        toVC.view.frame =CGRectMake(0,  0, containerView.frame.size.width, containerView.frame.size.height); 
        //        fromVC.view.transform = CGAffineTransformIdentity;
        //        tempView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
//          [containerView addSubview:toVC.view];
        if ([transitionContext transitionWasCancelled]) {
            //失败了标记失败
            [transitionContext completeTransition:NO];
        }else{
            //如果成功了，我们需要标记成功，同时让vc1显示出来，然后移除截图视图，
            [transitionContext completeTransition:YES];
//            toVC.view.hidden = NO;
//            [tempView removeFromSuperview];
        }
    }];
}
-(void)juSetShowWithView:(UIView *)view{
    [view.layer setShadowColor:[UIColor colorWithWhite:0 alpha:0.2].CGColor];
    [view.layer setShadowOffset:CGSizeMake(-5, 0)];
    [view.layer setShadowRadius:15];
    [view.layer setShadowOpacity:1];
}
@end
