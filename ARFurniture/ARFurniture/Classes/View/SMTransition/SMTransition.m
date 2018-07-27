

//
//  SMTransition.m
//  BocThe
//
//  Created by ThanhSon on 7/23/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "SMTransition.h"

@implementation SMTransition

- (id)init {
    if (self = [super init]) {
        self.duration = 0.6f;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController * fromVC = (id)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromVC.view;
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toVC.view;
    if (_isPresent) {
        [self animateTransitionPresent:transitionContext fromVC:fromVC toVC:toVC fromView:fromView toView:toView];
    } else {
        [self animateTransitionDismiss:transitionContext fromVC:fromVC toVC:toVC fromView:fromView toView:toView];
    }
    
}

- (void)animateTransitionPresent:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView {
    
    UIView* containerView = [transitionContext containerView];
    
    CGRect frameView = toView.frame;
    
    UIView *imgFade = [[UIView alloc] initWithFrame:frameView];
    imgFade.backgroundColor = [UIColor blackColor];
    
    UIImageView *imgFakeToView = [self snapshotImageViewFromView:toView];
    [imgFakeToView setFrame:CGRectMake(0, frameView.size.height, frameView.size.width, frameView.size.height)];
    
    UIImageView *imgFakeFromView = [self snapshotImageViewFromView:fromView];
    [imgFakeFromView setFrame:frameView];
    
    toView.alpha = 0;
    fromView.alpha = 0;
    imgFade.alpha = 0;
    
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    [containerView addSubview:imgFakeFromView];
    [containerView addSubview:imgFade];
    [containerView addSubview:imgFakeToView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         imgFakeFromView.center = CGPointMake(imgFakeFromView.center.x, imgFakeFromView.center.y - imgFakeFromView.center.y);
                         imgFakeToView.frame = frameView;
                         imgFade.alpha = 0.3;
                         
                     } completion:^(BOOL finished) {
                         if ([transitionContext transitionWasCancelled]) {
                             [toView removeFromSuperview];
                         } else {
                             [fromView removeFromSuperview];
                         }
                         
                         toView.alpha = 1.0;
                         fromView.alpha = 1.0;
                         
                         [imgFakeFromView removeFromSuperview];
                         [imgFade removeFromSuperview];
                         [imgFakeToView removeFromSuperview];
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

- (void)animateTransitionDismiss:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView {
    
    UIView* containerView = [transitionContext containerView];
    
    CGRect frameView = toView.frame;
    
    UIView *imgFade = [[UIView alloc] initWithFrame:frameView];
    imgFade.backgroundColor = [UIColor blackColor];
    
    UIImageView *imgFakeToView = [self snapshotImageViewFromView:toView];
    [imgFakeToView setFrame:CGRectMake(0, -frameView.size.height, frameView.size.width, frameView.size.height)];
    
    UIImageView *imgFakeFromView = [self snapshotImageViewFromView:fromView];
    [imgFakeFromView setFrame:frameView];
    
    toView.alpha = 0;
    fromView.alpha = 0;
    imgFade.alpha = 0;
    
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    [containerView addSubview:imgFakeFromView];
    [containerView addSubview:imgFade];
    [containerView addSubview:imgFakeToView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         imgFakeFromView.center = CGPointMake(imgFakeFromView.center.x, imgFakeFromView.center.y + imgFakeFromView.center.y);
                         imgFakeToView.frame = frameView;
                         imgFade.alpha = 0.2;
                         
                     } completion:^(BOOL finished) {
                         if ([transitionContext transitionWasCancelled]) {
                             [toView removeFromSuperview];
                         } else {
                             [fromView removeFromSuperview];
                         }
                         
                         toView.alpha = 1.0;
                         fromView.alpha = 1.0;
                         
                         [imgFakeFromView removeFromSuperview];
                         [imgFade removeFromSuperview];
                         [imgFakeToView removeFromSuperview];
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}


#pragma mark - TakeSnapShot

-(UIImageView *)snapshotImageViewFromView:(UIView *)view {
    UIImage * snapshot = [self dt_takeSnapshotWihtView:view];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:snapshot];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.clipsToBounds = YES;
    return imageView;
}


-(UIImage *)dt_takeSnapshotWihtView:(UIView*)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshot;
}

@end
