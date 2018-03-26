//
//  UIColor+Modify.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/2.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Modify)

#pragma mark - 获取颜色的倒颜色
/*!
 *  @author DT, 15-09-02 11:09:45
 *
 *  @brief  获取颜色的倒颜色
 *
 *  @return 倒颜色UIColor
 */
- (UIColor *)invertedColor;

#pragma mark - 颜色减淡
/*!
 *  @author DT, 15-09-02 11:09:30
 *
 *  @brief  颜色减淡
 *
 *  @param lighten 淡化值,1为透明
 *
 *  @return 减淡后的UIColor
 */
- (UIColor *)lightenColor:(CGFloat)lighten;

#pragma mark - 颜色加深
/*!
 *  @author DT, 15-09-02 11:09:30
 *
 *  @brief  颜色加深
 *
 *  @param lighten 加深值,1为黑色
 *
 *  @return 加深后的UIColor
 */
- (UIColor *)darkenColor:(CGFloat)darken;

@end
