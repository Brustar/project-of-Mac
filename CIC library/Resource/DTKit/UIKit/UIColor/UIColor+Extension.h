//
//  UIColor+Extension.h
//  DTKitDemo
//
//  Created by DT on 15/9/2.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

#pragma mark - 颜色渐变
/*!
 *  @author DT
 *
 *  @brief  颜色渐变
 *
 *  @param c1     开始颜色
 *  @param c2     结束颜色
 *  @param height 过渡高度
 *
 *  @return UIColor
 */
+ (UIColor*)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;

#pragma mark - 获取随机颜色值
/*!
 *  @author DT, 15-09-02 11:09:04
 *
 *  @brief  获取随机颜色值
 *
 *  @return 随机颜色UIColor
 */
+ (UIColor *)randomColor;

#pragma mark - 根据16进制字符串获取颜色
/*!
 *  @author DT, 15-09-02 11:09:42
 *
 *  @brief  根据16进制字符串获取颜色
 *
 *  @param hexString 16进制字符串
 *
 *  @return 16进制UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

#pragma mark - 根据16进制字符串和透明度获取颜色
/*!
 *  @author DT, 15-09-02 11:09:42
 *
 *  @brief  根据16进制字符串和透明度获取颜色
 *
 *  @param hexString 16进制字符串
 *
 *  @return 16进制UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

#pragma mark - 返回颜色的16进制字符串
/*!
 *  @author DT, 15-09-02 11:09:11
 *
 *  @brief  返回颜色的16进制字符串
 *
 *  @return 16进制字符串
 */
- (NSString *)HEXString;

@end
