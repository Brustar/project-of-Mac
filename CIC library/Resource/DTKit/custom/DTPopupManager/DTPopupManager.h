//
//  DTPopupManager.h
//  popupDemo
//
//  Created by DT on 15/9/16.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIGestureRecognizer+BlocksKit.h"

typedef enum {
    PopupViewAnimationNone, //没有动画
    PopupViewAnimationFadeIn,//淡入动画
    PopupViewAnimationFadeOut,//淡出动画
    PopupViewAnimationZoomIn,//放大动画
    PopupViewAnimationZoomOut,//缩小动画
    PopupViewAnimationSpreadIn,//扩散缩小动画
    PopupViewAnimationSpreadOut,//扩散大动画
    PopupViewAnimationSlideBottom,//底部上升动画
    PopupViewAnimationSlideTop,//顶部下降动画
    PopupViewAnimationSlideLeft,//右滑动画
    PopupViewAnimationSlideRight,//左滑动画
} PopupViewAnimation;

/** 回调函数 */
typedef void (^popupCompletion)();

/*!
 *  @author DT
 *
 *  @brief  弹出视图动画引擎
 */
@interface DTPopupManager : NSObject

/** 背景图层 */
@property (nonatomic,strong) UIView *backgroundView;

/** 默认手势,可以调用enabled属性禁用 */
@property (nonatomic,strong) UITapGestureRecognizer *tapGesture;

/** 消失动画类型,默认PopupViewAnimationNone */
@property (nonatomic,assign) PopupViewAnimation dismissAnimationType;

/** 动画时间,默认0.25秒 */
@property (nonatomic,assign) CGFloat animationDuration;

/** 是否局中,默认不局中 */
@property (nonatomic,assign) BOOL isShowCenter;

/** 初始化方法 */
+ (instancetype)defaultManager;

/*!
 *  @author DT
 *
 *  @brief  弹出视图
 *
 *  @param popupView     需要弹出的视图
 *  @param animationType 动画类型
 */
- (void) presentPopupView:(UIView*)popupView
            animationType:(PopupViewAnimation)animationType;

/*!
 *  @author DT
 *
 *  @brief  弹出视图
 *
 *  @param popupView         需要弹出的视图
 *  @param animationType     动画类型
 *  @param showCompletion    动画显示完成回调
 *  @param dismissCompletion 动画消失完成回调
 */
- (void) presentPopupView:(UIView*)popupView
            animationType:(PopupViewAnimation)animationType
           showCompletion:(popupCompletion)showCompletion
        dismissCompletion:(popupCompletion)dismissCompletion;

- (void)dismiss;

@end
