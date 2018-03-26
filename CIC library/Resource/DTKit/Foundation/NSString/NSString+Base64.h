//
//  NSString+Base64.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  @author DT
 *
 *  @brief  NSString的Base64数据加密解密
 */
@interface NSString (Base64)

#pragma mark - NSString数据加密
/*!
 *  @author DT
 *
 *  @brief  把String字符串加密成Base64格式的NSString
 *
 *  @param string 预加密的String字符串
 *
 *  @return 加密后的String字符串
 */
+ (NSString *)stringWithBase64EncodedString:(NSString *)string;

/*!
 *  @author DT
 *
 *  @brief  把String字符串加密成Base64格式的NSString
 *
 *  @return 加密后的String字符串
 */
- (NSString *)base64EncodedString;

/*!
 *  @author DT
 *
 *  @brief  把String字符串加密成Base64格式的NSString
 *
 *  @param wrapWidth 加密的长度,可选有65,76,其他
 *
 *  @return 加密后的String字符串
 */
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

#pragma mark - NSString数据解密
/*!
 *  @author DT
 *
 *  @brief  Base64格式的NSString解密为NSString字符串
 *
 *  @return 解密后的String字符串
 */
- (NSString *)base64DecodedString;

/*!
 *  @author DT
 *
 *  @brief  Base64格式的NSString解密为NSData格式的数据
 *
 *  @return 解密后的NSData数据
 */
- (NSData *)base64DecodedData;

@end
