//
//  UIView+Rect.h
//  uikitDemo
//
//  Created by DT on 15/8/12.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @author DT
 *
 *  @brief  UIView的类别,主要是为了获取frame的各项属性
 */
@interface UIView (Rect)

/** 获取size的值 */
@property(nonatomic,assign) CGSize size;

/** 获取origin的值 */
@property(nonatomic,assign) CGPoint origin;

/** 获取width宽度 */
@property(nonatomic,assign) CGFloat width;

/** 获取height高度 */
@property(nonatomic,assign) CGFloat height;

/** 获取x的值 */
@property(nonatomic,assign) CGFloat left;

/** 获取y的值 */
@property(nonatomic,assign) CGFloat top;

/** 获取x+width的值 */
@property(nonatomic,assign,readonly) CGFloat right;

/** 获取y+height的值 */
@property(nonatomic,assign,readonly) CGFloat bottom;

/** 设置x坐标的偏移量,获取此值为0 */
@property(nonatomic,assign) CGFloat offsetX;

/** 设置y坐标的偏移量,获取此值为0 */
@property(nonatomic,assign) CGFloat offsetY;

/** 设置width的偏移量,获取此值为0 */
@property(nonatomic,assign) CGFloat offsetWidth;

/** 设置height的偏移量,获取此值为0 */
@property(nonatomic,assign) CGFloat offsetHeight;

@end
