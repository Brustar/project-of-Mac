//
//  UIView+Attributes.h
//  uikitDemo
//
//  Created by DT on 15/8/15.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @author DT
 *
 *  @brief  UIView的分类
 */
@interface UIView (Attributes)

/*!
 *  @author DT
 *
 *  @brief  圆形View;
 */
- (void) setBound;

/*!
 *  @author DT
 *
 *  @brief  view的边缘角度
 *
 *  @param radius 角度
 */
- (void) setBoundOfRadius:(CGFloat)radius;

/*!
 *  @author DT
 *
 *  @brief  view的边缘角度
 *
 *  @param radius 角度
 *  @param width  边框
 */
- (void) setBoundOfRadius:(CGFloat)radius width:(CGFloat)width;

/*!
 *  @author DT
 *
 *  @brief  view的边缘角度
 *
 *  @param radius 角度
 *  @param width  边框
 *  @param color  颜色
 */
- (void) setBoundOfRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor*)color;

/*!
 *  @author DT, 15-08-29 21:08:53
 *
 *  @brief  设置UIView浮度
 *
 *  @param radius 度数
 */
-(void) setRectAllCorner:(CGFloat)radius;

/*!
 *  @author DT, 15-08-29 21:08:22
 *
 *  @brief  设置UIView浮度
 *
 *  @param radius  度数
 *  @param corners 位置
 */
-(void) setRectCorner:(CGFloat)radius roundingCorners:(UIRectCorner)corners;


/*
 * 设置UIView周边加阴影，并且同时圆角
 */
- (void)addShadowToViewWithOpacity:(float)shadowOpacity
                      shadowRadius:(CGFloat)shadowRadius
                   andCornerRadius:(CGFloat)cornerRadius;


/*
 * 设置UIView添加虚线边框
 */
-(void) setDashBorder;

@end
