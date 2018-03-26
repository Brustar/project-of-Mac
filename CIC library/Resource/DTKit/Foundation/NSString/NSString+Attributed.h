//
//  NSString+Attributed.h
//  uikitDemo
//
//  Created by DT on 15/8/15.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Attributed)

#pragma mark - 设置字符串字体大小
/*!
 *  @author DT
 *
 *  @brief  设置字符串字体大小
 *
 *  @param size 字体大小
 *
 *  @return NSMutableAttributedString
 */
- (NSMutableAttributedString*) setFontOfSize:(CGFloat)size;

/*!
 *  @author DT
 *
 *  @brief  设置字符串字体大小
 *
 *  @param size   字体大小
 *  @param string 需要改变大小的字符串
 *
 *  @return NSMutableAttributedString
 */
- (NSMutableAttributedString*) setFontOfSize:(CGFloat)size string:(NSString*)string;

#pragma mark - 设置字符串字体颜色
/*!
 *  @author DT
 *
 *  @brief  设置字符串字体颜色
 *
 *  @param foregroundColor 颜色
 *
 *  @return NSMutableAttributedString
 */
- (NSMutableAttributedString*) setForegroundColor:(UIColor*)foregroundColor;

/*!
 *  @author DT
 *
 *  @brief  设置字符串字体颜色
 *
 *  @param foregroundColor 颜色
 *  @param string          需要改变颜色的字符串
 *
 *  @return NSMutableAttributedString
 */
- (NSMutableAttributedString*) setForegroundColor:(UIColor*)foregroundColor string:(NSString*)string;

#pragma mark - 显示html内容
/*!
 *  @author DT
 *
 *  @brief  显示html内容
 *
 *  @return NSMutableAttributedString
 */
- (NSMutableAttributedString*) setHTMLTextDocument;

/*!
 *  @author DT
 *
 *  @brief  显示html内容
 *  @param string          需要显示html的字符串
 *
 *  @return NSMutableAttributedString
 */
- (NSMutableAttributedString*) setHTMLTextDocument:(NSString*)string;

#pragma mark - 设置字符串删除线
/*!
 *  @author DT
 *
 *  @brief  设置字符串删除线
 *
 *  @return NSMutableAttributedString
 */
- (NSMutableAttributedString*) setStrikethrough;

/*!
 *  @author DT
 *
 *  @brief  设置字符串删除线
 *
 *  @param string 需要删除线的字符串
 *
 *  @return NSMutableAttributedString
 */
- (NSMutableAttributedString*) setStrikethrough:(NSString*)string;

/*!
 *  @author DT
 *
 *  @brief  设置字符串删除线
 *
 *  @param string 需要删除线的字符串
 *  @param color  颜色
 *
 *  @return NSMutableAttributedString
 */
- (NSMutableAttributedString*) setStrikethrough:(NSString*)string color:(UIColor*)color;

/*!
 *  @author DT
 *
 *  @brief  设置字符串删除线
 *
 *  @param string 需要删除线的字符串
 *  @param color  颜色
 *  @param style  删除线样式
 *
 *  @return NSMutableAttributedString
 */
- (NSMutableAttributedString*) setStrikethrough:(NSString*)string color:(UIColor*)color style:(NSUnderlineStyle)style;

@end
