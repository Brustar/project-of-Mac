//
//  UIScrollView+APParallaxHeader.h
//
//  Created by Mathias Amnell on 2013-04-12.
//  Copyright (c) 2013 Apping AB. All rights reserved.
//  https://github.com/apping/APParallaxHeader
//   Category that makes it super easy to add a parallax effect to your UIScrollView/UITableView

#import <UIKit/UIKit.h>

@class APParallaxView;
@class APParallaxShadowView;

#pragma mark UIScrollView Category

#pragma mark - 增加UIScrollView视觉差分类
/*!
 *  @author DT
 *
 *  @brief  增加UIScrollView视觉差View
 */
@interface UIScrollView (APParallaxHeader)

#pragma mark - 增加视觉差图片
/*!
 *  @author DT
 *
 *  @brief  增加视觉差图片
 *
 *  @param image  图片
 *  @param height 高度
 *  @param shadow 是否有阴影,默认是YES
 */
- (void)addParallaxWithImage:(UIImage *)image andHeight:(CGFloat)height andShadow:(BOOL)shadow;

/*!
 *  @author DT
 *
 *  @brief  增加视觉差图片
 *
 *  @param image  图片
 *  @param height 高度
 */
- (void)addParallaxWithImage:(UIImage *)image andHeight:(CGFloat)height;

#pragma mark - 增加视觉差视图
/*!
 *  @author DT
 *
 *  @brief  增加视觉差视图
 *
 *  @param UIView 视图
 *  @param height 高度
 */
- (void)addParallaxWithView:(UIView*)view andHeight:(CGFloat)height;

@property (nonatomic, strong, readonly) APParallaxView *parallaxView;
@property (nonatomic, assign) BOOL showsParallax;

@end

#pragma mark - APParallaxView

@protocol APParallaxViewDelegate;

typedef NS_ENUM(NSUInteger, APParallaxTrackingState) {
    APParallaxTrackingActive = 0,
    APParallaxTrackingInactive
};

@interface APParallaxView : UIView

@property (weak) id<APParallaxViewDelegate> delegate;

@property (nonatomic, readonly) APParallaxTrackingState state;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *currentSubView;
@property (nonatomic, strong) APParallaxShadowView *shadowView;
@property (nonatomic, strong) UIView *customView;

- (id)initWithFrame:(CGRect)frame andShadow:(BOOL)shadow;

@end

@protocol APParallaxViewDelegate <NSObject>
@optional
- (void)parallaxView:(APParallaxView *)view willChangeFrame:(CGRect)frame;
- (void)parallaxView:(APParallaxView *)view didChangeFrame:(CGRect)frame;
@end

#pragma mark APParallaxShadowView

@interface APParallaxShadowView : UIView

@end
