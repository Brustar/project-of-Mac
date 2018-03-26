//
//  DTPopupManager.m
//  popupDemo
//
//  Created by DT on 15/9/16.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "DTPopupManager.h"
#import "UIView+GestureCallback.h"
#import "UIGestureRecognizer+BlocksKit.h"

/** 获取x坐标 */
CGFloat systemX(UIView *view)
{
    return view.frame.origin.x;
}

/** 获取宽度 */
CGFloat systemWidth(UIView *view)
{
    return view.frame.size.width;
}

/** 获取x+witdh */
CGFloat systemRight(UIView *view)
{
    return systemX(view)+systemWidth(view);
}

/** 获取y坐标 */
CGFloat systemY(UIView *view)
{
    return view.frame.origin.y;
}

/** 获取高度 */
CGFloat systemHeight(UIView *view)
{
    return view.frame.size.height;
}

/** 获取y+高度 */
CGFloat systemBottom(UIView *view)
{
    return systemY(view)+systemHeight(view);
}

// block self
//#define WEAKSELF typeof(self) __weak weakSelf = self;

@interface DTPopupManager()
{
    UIView *_popupView;
    CGRect _popupViewRect;
    PopupViewAnimation _animationType;
    popupCompletion _showCompletion;
    popupCompletion _dismissCompletion;
    BOOL _customDismissAnimation;
    PopupViewAnimation _dismissAnimation;
}

@end

@implementation DTPopupManager

- (void)dealloc {
    NSLog(@"dealloc....");
}

+ (instancetype)defaultManager {
    DTPopupManager *manager = [[DTPopupManager alloc] init];
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.animationDuration = 0.25;
        self.isShowCenter = YES;
        _customDismissAnimation = NO;
        _dismissAnimation = PopupViewAnimationNone;
        
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        self.backgroundView = [[UIView alloc] initWithFrame:window.bounds];
        self.backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        
        [window addSubview:self.backgroundView];
        
        self.tapGesture = [UITapGestureRecognizer bk_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
            [self handleTapGesture:self.tapGesture];
        }];
        
        [self.backgroundView addGestureRecognizer:self.tapGesture];
    }
    return self;
}

- (void) presentPopupView:(UIView*)popupView animationType:(PopupViewAnimation)animationType
{
    [self presentPopupView:popupView animationType:animationType showCompletion:nil dismissCompletion:nil];
}

- (void) presentPopupView:(UIView*)popupView
            animationType:(PopupViewAnimation)animationType
           showCompletion:(popupCompletion)showCompletion
        dismissCompletion:(popupCompletion)dismissCompletion
{
    self.backgroundView.alpha = 1.0f;
    _popupView = popupView;
    _animationType = animationType;
    _showCompletion = showCompletion;
    _dismissCompletion = dismissCompletion;
    _popupViewRect = _popupView.frame;
    
    [self.backgroundView addSubview:_popupView];
    switch (animationType) {
        case PopupViewAnimationNone:
            [self noneViewIn];
            break;
        case PopupViewAnimationFadeIn:
            [self fadeViewIn];
            break;
        case PopupViewAnimationFadeOut:
            [self fadeViewOut];
            break;
        case PopupViewAnimationZoomIn:
            [self zoomViewIn];
            break;
        case PopupViewAnimationZoomOut:
            [self zoomViewOut];
            break;
        case PopupViewAnimationSpreadIn:
            [self spreadViewIn];
            break;
        case PopupViewAnimationSpreadOut:
            [self spreadViewOut];
            break;
        case PopupViewAnimationSlideBottom:
        case PopupViewAnimationSlideTop:
        case PopupViewAnimationSlideLeft:
        case PopupViewAnimationSlideRight:
            [self slideViewIn:animationType];
            break;
        default:
            
            break;
    }
}

#pragma mark - animation
- (void)fadeViewIn {
    _popupView.alpha = 0.0f;
    if (self.isShowCenter) {
        _popupView.center = self.backgroundView.center;
    }
    
    [UIView animateWithDuration:self.animationDuration animations:^{
        _popupView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        if (_showCompletion) {
            _showCompletion();
        }
    }];
}

- (void)fadeViewOut {
    [UIView animateWithDuration:self.animationDuration animations:^{
        _popupView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.backgroundView.alpha = 0.0f;
        _popupView.frame = _popupViewRect;
        if (_dismissCompletion) {
            _dismissCompletion();
        }
    }];
}

- (void)slideViewIn:(PopupViewAnimation)animationType
{
    CGRect popupStartRect;
    CGRect popupEndRect;
    switch (animationType) {
        case PopupViewAnimationSlideBottom:
            if (self.isShowCenter) {
                popupStartRect = CGRectMake((systemWidth(self.backgroundView)-systemWidth(_popupView))/2,
                                            systemHeight(self.backgroundView),
                                            systemWidth(_popupView),
                                            systemHeight(_popupView));
            }else{
                popupStartRect = CGRectMake(systemX(_popupView),
                                            systemHeight(self.backgroundView),
                                            systemWidth(_popupView),
                                            systemHeight(_popupView));
            }
            break;
        case PopupViewAnimationSlideTop:
            if (self.isShowCenter) {
                popupStartRect = CGRectMake((systemWidth(self.backgroundView)-systemWidth(_popupView))/2,
                                            -systemHeight(self.backgroundView),
                                            systemWidth(_popupView),
                                            systemHeight(_popupView));
            }else{
                popupStartRect = CGRectMake(systemX(_popupView),
                                            -systemHeight(self.backgroundView),
                                            systemWidth(_popupView),
                                            systemHeight(_popupView));
            }
            break;
        case PopupViewAnimationSlideLeft:
            if (self.isShowCenter) {
                popupStartRect = CGRectMake(-systemWidth(self.backgroundView),
                                            (systemHeight(self.backgroundView)-systemHeight(_popupView))/2,
                                            systemWidth(_popupView),
                                            systemHeight(_popupView));
            }else{
                popupStartRect = CGRectMake(-systemWidth(self.backgroundView),
                                            systemY(_popupView),
                                            systemWidth(_popupView),
                                            systemHeight(_popupView));
            }
            break;
        case PopupViewAnimationSlideRight:
            if (self.isShowCenter) {
                popupStartRect = CGRectMake(systemWidth(self.backgroundView),
                                            (systemHeight(self.backgroundView)-systemHeight(_popupView))/2,
                                            systemWidth(_popupView),
                                            systemHeight(_popupView));
            }else{
                popupStartRect = CGRectMake(systemWidth(self.backgroundView),
                                            systemY(_popupView),
                                            systemWidth(_popupView),
                                            systemHeight(_popupView));
            }
            break;
        default:
            break;
    }
    if (self.isShowCenter) {
        popupEndRect = CGRectMake((systemWidth(self.backgroundView)-systemWidth(_popupView))/2,
                                  (systemHeight(self.backgroundView)-systemHeight(_popupView))/2,
                                  systemWidth(_popupView),
                                  systemHeight(_popupView));
    }else{
        popupEndRect = CGRectMake(systemX(_popupView),
                                  systemY(_popupView),
                                  systemWidth(_popupView),
                                  systemHeight(_popupView));
    }
    _popupView.frame = popupStartRect;
    _popupView.alpha = 1.0f;
    [UIView animateWithDuration:self.animationDuration animations:^{
        _popupView.frame = popupEndRect;
    } completion:^(BOOL finished) {
        if (_showCompletion) {
            _showCompletion();
        }
    }];
}

- (void)slideViewOut:(PopupViewAnimation)animationType
{
    CGRect popupEndRect;
    switch (animationType) {
        case PopupViewAnimationSlideTop:
            if (self.isShowCenter) {
                popupEndRect = CGRectMake((systemWidth(self.backgroundView)-systemWidth(_popupView))/2,
                                          -systemHeight(self.backgroundView),
                                          systemWidth(_popupView),
                                          systemHeight(_popupView));
            }else{
                popupEndRect = CGRectMake(systemX(_popupView),
                                          -systemHeight(self.backgroundView),
                                          systemWidth(_popupView),
                                          systemHeight(_popupView));
            }
            break;
        case PopupViewAnimationSlideBottom:
            if (self.isShowCenter) {
                popupEndRect = CGRectMake((systemWidth(self.backgroundView)-systemWidth(_popupView))/2,
                                          systemHeight(self.backgroundView),
                                          systemWidth(_popupView),
                                          systemHeight(_popupView));
            }else{
                popupEndRect = CGRectMake(systemX(_popupView),
                                          systemHeight(self.backgroundView),
                                          systemWidth(_popupView),
                                          systemHeight(_popupView));
            }
            break;
        case PopupViewAnimationSlideLeft:
            if (self.isShowCenter) {
                popupEndRect = CGRectMake(-systemWidth(self.backgroundView),
                                          (systemHeight(self.backgroundView)-systemHeight(_popupView))/2,
                                          systemWidth(_popupView),
                                          systemHeight(_popupView));
            }else{
                popupEndRect = CGRectMake(-systemWidth(self.backgroundView),
                                          systemY(_popupView),
                                          systemWidth(_popupView),
                                          systemHeight(_popupView));
            }
            break;
        case PopupViewAnimationSlideRight:
            if (self.isShowCenter) {
                popupEndRect = CGRectMake(systemWidth(self.backgroundView),
                                          (systemHeight(self.backgroundView)-systemHeight(_popupView))/2,
                                          systemWidth(_popupView),
                                          systemHeight(_popupView));
            }else{
                popupEndRect = CGRectMake(systemWidth(self.backgroundView),
                                          systemY(_popupView),
                                          systemWidth(_popupView),
                                          systemHeight(_popupView));
            }
            break;
            
        default:
            break;
    }
    [UIView animateWithDuration:self.animationDuration animations:^{
        _popupView.frame = popupEndRect;
    } completion:^(BOOL finished) {
        self.backgroundView.alpha = 0.0f;
        _popupView.frame = _popupViewRect;
        if (_showCompletion) {
            _showCompletion();
        }
    }];
}

- (void)zoomViewIn {
    _popupView.alpha = 1.f;
    if (self.isShowCenter) {
        _popupView.center = self.backgroundView.center;
    }
    _popupView.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:self.animationDuration animations:^{
        _popupView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        if (_showCompletion) {
            _showCompletion();
        }
    }];
}

- (void)zoomViewOut {
    _popupView.alpha = 1.f;
    if (self.isShowCenter) {
        _popupView.center = self.backgroundView.center;
    }
    _popupView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:self.animationDuration animations:^{
        _popupView.transform = CGAffineTransformMakeScale(0, 0);
        
    } completion:^(BOOL finished) {
        _popupView.transform = CGAffineTransformIdentity;
        _popupView.frame = _popupViewRect;
        self.backgroundView.alpha = 0.f;
        if (_showCompletion) {
            _showCompletion();
        }
    }];
}

- (void) spreadViewIn {
    _popupView.alpha = 1.f;
    if (self.isShowCenter) {
        _popupView.center = self.backgroundView.center;
    }
    
    /*
    _popupView.layer.transform = CATransform3DMakeScale(1.2f, 1.2f, 1.0f);
    _popupView.alpha = 0.0f;
    
    [UIView animateWithDuration:self.animationDuration
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         _popupView.layer.transform = CATransform3DIdentity;
                         _popupView.alpha = 1.0f;
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
     //*/
    
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(4, 4);
    _popupView.transform = scaleTransform;
    [UIView animateWithDuration:self.animationDuration animations:^{
        _popupView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if (_showCompletion) {
            _showCompletion();
        }
    }];
}

- (void) spreadViewOut {
    if (self.isShowCenter) {
        _popupView.center = self.backgroundView.center;
    }
    [UIView animateWithDuration:self.animationDuration animations:^{
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(4, 4);
        _popupView.transform = scaleTransform;
        _popupView.alpha = 0.f;
    } completion:^(BOOL finished) {
        _popupView.transform = CGAffineTransformIdentity;
        _popupView.frame = _popupViewRect;
        self.backgroundView.alpha = 0.f;
    }];
}

- (void) noneViewIn {
    _popupView.alpha = 1.f;
}

- (void) noneViewOut {
    _popupView.alpha = 0.f;
    self.backgroundView.alpha = 0.f;
}

#pragma mark - UITapGestureRecognizer response
- (void)handleTapGesture:(UITapGestureRecognizer*)gesture {
    //拿到手指目前的位置
    CGPoint location = [gesture locationInView:self.backgroundView];
    
    if (!CGRectContainsPoint(_popupView.frame, location)) {//手指不在popupView试图内
        if (_customDismissAnimation) {
            switch (_dismissAnimation) {
                case PopupViewAnimationNone:
                    [self noneViewOut];
                    break;
                case PopupViewAnimationFadeIn:
                    [self fadeViewIn];
                    break;
                case PopupViewAnimationFadeOut:
                    [self fadeViewOut];
                    break;
                case PopupViewAnimationZoomIn:
                    [self zoomViewIn];
                    break;
                case PopupViewAnimationZoomOut:
                    [self zoomViewOut];
                    break;
                case PopupViewAnimationSpreadIn:
                    [self spreadViewIn];
                    break;
                case PopupViewAnimationSpreadOut:
                    [self spreadViewOut];
                    break;
                case PopupViewAnimationSlideBottom:
                case PopupViewAnimationSlideTop:
                case PopupViewAnimationSlideLeft:
                case PopupViewAnimationSlideRight:
                    [self slideViewOut:_animationType];
                    break;
                default:
                    break;
            }
            return;
        }
        switch (_animationType) {
            case PopupViewAnimationNone:
                [self noneViewOut];
                break;
            case PopupViewAnimationFadeIn:
                [self fadeViewOut];
                break;
            case PopupViewAnimationFadeOut:
                [self fadeViewIn];
                break;
            case PopupViewAnimationZoomIn:
                [self zoomViewOut];
                break;
            case PopupViewAnimationZoomOut:
                [self zoomViewIn];
                break;
            case PopupViewAnimationSpreadIn:
                [self spreadViewOut];
                break;
            case PopupViewAnimationSpreadOut:
                [self spreadViewIn];
                break;
            case PopupViewAnimationSlideBottom:
            case PopupViewAnimationSlideTop:
            case PopupViewAnimationSlideLeft:
            case PopupViewAnimationSlideRight:
                [self slideViewOut:_animationType];
                break;
            default:
                break;
        }
    }
}


- (void)dismiss {
    switch (_animationType) {
        case PopupViewAnimationNone:
            [self noneViewOut];
            break;
        case PopupViewAnimationFadeIn:
            [self fadeViewOut];
            break;
        case PopupViewAnimationFadeOut:
            [self fadeViewIn];
            break;
        case PopupViewAnimationZoomIn:
            [self zoomViewOut];
            break;
        case PopupViewAnimationZoomOut:
            [self zoomViewIn];
            break;
        case PopupViewAnimationSpreadIn:
            [self spreadViewOut];
            break;
        case PopupViewAnimationSpreadOut:
            [self spreadViewIn];
            break;
        case PopupViewAnimationSlideBottom:
        case PopupViewAnimationSlideTop:
        case PopupViewAnimationSlideLeft:
        case PopupViewAnimationSlideRight:
            [self slideViewOut:_animationType];
            break;
        default:
            break;
    }
}

#pragma mark - setter
- (void) setDismissAnimationType:(PopupViewAnimation)dismissAnimationType {
    _customDismissAnimation = YES;
    _dismissAnimation = dismissAnimationType;
}

@end
