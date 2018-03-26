//
//  NSString+Contains.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by 符现超 on 15/5/9.
//  Copyright (c) 2015年 http://weibo.com/u/1655766025 All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Contains)

#pragma mark - 判断URL中是否包含中文
/*!
 *  @author DT
 *
 *  @brief  判断URL中是否包含中文
 *
 *  @return
 */
- (BOOL)isContainChinese;

/*!
 *  @author DT
 *
 *  @brief  是否包含空格
 *
 *  @return
 */
- (BOOL)isContainBlank;

#pragma mark - Unicode编码的字符串转成NSString
/*!
 *  @author DT
 *
 *  @brief  Unicode编码的字符串转成NSString
 *
 *  @return
 */
- (NSString *)makeUnicodeToString;

#pragma mark - 判断字符串是否包含NSCharacterSet类型数据
/*!
 *  @author DT
 *
 *  @brief  判断字符串是否包含NSCharacterSet类型数据
 *
 *  @param set NSCharacterSet
 *
 *  @return
 */
- (BOOL)containsCharacterSet:(NSCharacterSet *)set;

#pragma mark - 判断字符串是否包含string数据
/*!
 *  @author DT
 *
 *  @brief  判断字符串是否包含string数据
 *
 *  @param string 包含数据
 *
 *  @return
 */
- (BOOL)containsString:(NSString *)string;

#pragma mark - 统计字符串字数
/*!
 *  @author DT
 *
 *  @brief  统计字符串字数
 *
 *  @return
 */
- (int)wordsCount;

#pragma mark - 将金额转换成带逗号的格式
/*!
 *  @author DT
 *
 *  @brief  将金额转换成带逗号的格式
 *
 *  @return
 */
- (NSString *)toFormatNumberString;

#pragma mark - 获取当前使用的语言
/*!
 *  @author DT
 *
 *  @brief  获取当前使用的语言
 *
 *  @return
 */
+ (NSString *)getLocateCode;


@end
