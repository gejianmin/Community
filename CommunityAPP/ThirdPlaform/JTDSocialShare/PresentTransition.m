//
//  PresentTransition.m
//  CustomPresent
//
//  Created by Lxrent on 16/8/24.
//  Copyright © 2016年 Lxrent. All rights reserved.
//

#import "PresentTransition.h"
#import "JTDShareVC.h"
#import "CustomPresentation.h"

@interface PresentTransition()

@property (nonatomic,strong) JTDShareVC *toView;

@end

@implementation PresentTransition

BOOL isPresent;

#define animationDuration 0.6


-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    
    CustomPresentation *custom = [[CustomPresentation alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    
    return custom;
}

//展现
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    isPresent = YES;
    
    return  self;
}

//关闭
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    isPresent = NO;

    return self;
}

//动画时长
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.1;
}



- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    JTDShareVC *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * container = [transitionContext containerView];

    if (isPresent) {
        
        [container addSubview:toVC.view];
        
        // 设置archPoint和position
        CGRect initalFrame = [transitionContext initialFrameForViewController:fromVC];
        toVC.view.frame = initalFrame;
        fromVC.view.frame = initalFrame;
        
     toVC.view.layer.transform = CATransform3DMakeScale(0.2, 0.2, 1.0);
        
    [UIView animateWithDuration:animationDuration delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
    toVC.view.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);

        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
        
    }else{
        
    [UIView animateWithDuration:animationDuration animations:^{
        
        fromVC.view.layer.transform = CATransform3DMakeScale(0.01, 0.01, 1.0);
        
    } completion:^(BOOL finished) {
        
    [transitionContext completeTransition:YES];
        
    }];
        
        
    }
    
}


@end
