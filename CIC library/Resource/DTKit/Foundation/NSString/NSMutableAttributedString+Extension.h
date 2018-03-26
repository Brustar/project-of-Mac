//
//  NSMutableAttributedString+Extension.h
//  uikitDemo
//
//  Created by DT on 15/8/17.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (Extension)

#pragma mark - 设置字符串字体颜色
/*!
 *  @author DT
 *
 *  @brief  设置字符串字体颜色
 *
 *  @param foregroundColor 颜色
 */
- (void) setForegroundColor:(UIColor*)foregroundColor;

/*!
 *  @author DT
 *
 *  @brief  设置字符串字体颜色
 *
 *  @param foregroundColor 颜色
 *  @param string          需要改变颜色的字符串
 */
- (void) setForegroundColor:(UIColor*)foregroundColor string:(NSString*)string;

#pragma mark - 设置字符串背景颜色
/*!
 *  @author DT
 *
 *  @brief  设置字符串背景颜色
 *
 *  @param backgroundColor 颜色
 */
- (void) setBackgroundColor:(UIColor*)backgroundColor;

/*!
 *  @author DT
 *
 *  @brief  设置字符串背景颜色
 *
 *  @param backgroundColor 颜色
 *  @param string          需要改变颜色的字符串
 */
- (void) setBackgroundColor:(UIColor*)backgroundColor string:(NSString*)string;

#pragma mark - 设置字符串字体大小
/*!
 *  @author DT
 *
 *  @brief  设置字符串字体大小
 *
 *  @param size 字体大小
 */
- (void) setFontOfSize:(CGFloat)size;

/*!
 *  @author DT
 *
 *  @brief  设置字符串字体大小
 *
 *  @param size   字体大小
 *  @param string 需要改变大小的字符串
 */
- (void) setFontOfSize:(CGFloat)size string:(NSString*)string;

#pragma mark - 设置字符串间隔
/*!
 *  @author DT
 *
 *  @brief  设置字符串间隔
 *
 *  @param kernOfSize 间隔大小
 */
- (void) setKernOfSize:(CGFloat)kernOfSize;

/*!
 *  @author DT
 *
 *  @brief  设置字符串间隔
 *
 *  @param kernOfSize 间隔大小
 *  @param string     需要改变间隔距离的字符串
 */
- (void) setKernOfSize:(CGFloat)kernOfSize string:(NSString*)string;

#pragma mark - 设置字符串描边宽度
/*!
 *  @author DT
 *
 *  @brief  设置字符串描边宽度(这样就能使文字空心)
 *
 *  @param strokeWidth 宽度
 */
- (void) setStrokeWidth:(CGFloat)strokeWidth;

/*!
 *  @author DT
 *
 *  @brief  设置字符串描边宽度(这样就能使文字空心)
 *
 *  @param strokeWidth 宽度
 *  @param string      需要改变宽度的字符串
 */
- (void) setStrokeWidth:(CGFloat)strokeWidth string:(NSString*)string;

#pragma mark - 设置字符串描边颜色
/*!
 *  @author DT
 *
 *  @brief  设置字符串描边颜色
 *
 *  @param strokeColor 颜色
 */
- (void) setStrokeColor:(UIColor*)strokeColor;

/*!
 *  @author DT
 *
 *  @brief  设置字符串描边颜色
 *
 *  @param strokeColor 颜色
 *  @param string      需要改变颜色的字符串
 */
- (void) setStrokeColor:(UIColor*)strokeColor string:(NSString*)string;

#pragma mark - 设置行距距离
/*!
 *  @author DT
 *
 *  @brief  设置行距距离
 *
 *  @param lineSpacing 距离
 */
- (void) setLineSpacing:(CGFloat)lineSpacing;

/*!
 *  @author DT
 *
 *  @brief  设置行距间隔
 *
 *  @param lineSpacing 间隔
 *  @param string      需要改变间隔的字符串
 */
- (void) setLineSpacing:(CGFloat)lineSpacing string:(NSString*)string;

#pragma mark - 设置字符串倾斜度
/*!
 *  @author DT
 *
 *  @brief  设置字符串倾斜度
 *
 *  @param obliqueness 倾斜度
 */
- (void) setObliqueness:(CGFloat)obliqueness;

/*!
 *  @author DT
 *
 *  @brief  设置字符串倾斜度
 *
 *  @param obliqueness 倾斜度
 *  @param string      需要改变倾斜度的字符串
 */
- (void) setObliqueness:(CGFloat)obliqueness string:(NSString*)string;

#pragma mark - 设置字符串跳转超链接
/*!
 *  @author DT
 *
 *  @brief  设置字符串跳转超链接
 *
 *  @param jumpUrl 超链接地址
 */
- (void) setJumpUrl:(NSString*)jumpUrl;

/*!
 *  @author DT
 *
 *  @brief  设置字符串跳转超链接
 *
 *  @param jumpUrl 超链接地址
 *  @param string  超链接的字符串
 */
- (void) setJumpUrl:(NSString*)jumpUrl string:(NSString*)string;

#pragma mark - 设置字符串删除线
/*!
 *  @author DT
 *
 *  @brief  设置字符串删除线
 */
- (void) setStrikethrough;

/*!
 *  @author DT
 *
 *  @brief  设置字符串删除线
 *
 *  @param string 需要删除线的字符串
 */
- (void) setStrikethrough:(NSString*)string;

/*!
 *  @author DT
 *
 *  @brief  设置字符串删除线
 *
 *  @param string 需要删除线的字符串
 *  @param color  颜色
 */
- (void) setStrikethrough:(NSString*)string color:(UIColor*)color;

/*!
 *  @author DT
 *
 *  @brief  设置字符串删除线
 *
 *  @param string 需要删除线的字符串
 *  @param color  颜色
 *  @param style  删除线样式
 */
- (void) setStrikethrough:(NSString*)string color:(UIColor*)color style:(NSUnderlineStyle)style;

#pragma mark - 设置字符串下划线
/*!
 *  @author DT
 *
 *  @brief  设置字符串下划线
 */
- (void) setUnderline;

/*!
 *  @author DT
 *
 *  @brief  设置字符串下划线
 *
 *  @param string 需要下划线的字符串
 */
- (void) setUnderline:(NSString*)string;

/*!
 *  @author DT
 *
 *  @brief  设置字符串下划线
 *
 *  @param string 需要下划线的字符串
 *  @param color  颜色
 */
- (void) setUnderline:(NSString*)string color:(UIColor*)color;

/*!
 *  @author DT
 *
 *  @brief  设置字符串下划线
 *
 *  @param string 需要下划线的字符串
 *  @param color  颜色
 *  @param style  下划线样式
 */
- (void) setUnderline:(NSString*)string color:(UIColor*)color style:(NSUnderlineStyle)style;

#pragma mark - 设置字符串段落样式
/*!
 *  @author DT
 *
 *  @brief  设置字符串段落样式
 *
 *  @param paragraph 段落样式
 */
- (void) setParagraphStyle:(NSMutableParagraphStyle*)paragraph;

/*!
 *  @author DT
 *
 *  @brief  设置字符串段落样式
 *
 *  @param paragraph 段落样式
 *  @param string    需要改变样式的字符串
 */
- (void) setParagraphStyle:(NSMutableParagraphStyle*)paragraph string:(NSString*)string;

#pragma mark - 设置字符串阴影样式
/*!
 *  @author DT
 *
 *  @brief  设置字符串阴影样式
 *
 *  @param shadow 阴影样式
 */
- (void) setShadow:(NSShadow*)shadow;

/*!
 *  @author DT
 *
 *  @brief  设置字符串阴影样式
 *
 *  @param shadow 阴影样式
 *  @param string 需要改变阴影的字符串
 */
- (void) setShadow:(NSShadow*)shadow string:(NSString*)string;

@end
