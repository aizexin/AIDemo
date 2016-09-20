//
//  AITransitionAnimator.m
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/14.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AITransitionAnimator.h"
#import "AILoginViewController.h"
#import "MCLeftSlideViewController.h"
@interface AITransitionAnimator ()<UIViewControllerAnimatedTransitioning>
@property (weak, nonatomic) id transitionContext;
@end
@implementation AITransitionAnimator



// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    
    UIView *containerView = [transitionContext containerView];
    AILoginViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    KeepNewFeatrueView *keepView = fromVC.keepView;
    
    MCLeftSlideViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //得到登录按钮
    UIButton *btn = keepView.loginButton;
    
    [containerView addSubview:toVC.view];
    
    UIBezierPath *originPath = [UIBezierPath bezierPathWithOvalInRect:btn.frame];
    CGPoint extremePoint = CGPointMake(btn.center.x - 0, btn.center.y - CGRectGetHeight(toVC.view.bounds));
    
    float radius = sqrtf(extremePoint.x * extremePoint.x + extremePoint.y * extremePoint.y);
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(btn.frame, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = finalPath.CGPath;
    toVC.view.layer.mask = maskLayer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id _Nullable)(originPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
    animation.duration = [self transitionDuration:transitionContext];
    animation.delegate = self;
    [maskLayer addAnimation:animation forKey:@"path"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
}

@end
