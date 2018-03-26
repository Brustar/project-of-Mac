//
//  NSData+Base64.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/26.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  @author DT
 *
 *  @brief  NSData的Base64数据加密解密
 */
@interface NSData (Base64)

#pragma mark - base64加密
/*!
 *  @author DT
 *
 *  @brief  把String字符串加密成Base64格式的NSData,并控制宽度
 *
 *  @param wrapWidth 宽度值,64,76或其他
 *
 *  @return NSString
 */
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

/*!
 *  @author DT
 *
 *  @brief  把String字符串加密成Base64格式的NSData
 *
 *  @param string NSString
 *
 *  @return NSData
 */
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;

/*!
 *  @author DT
 *
 *  @brief  返回Base64加密后的NSData格式的NSString字符串
 *
 *  @return NSString
 */
- (NSString *)base64EncodedString;

#pragma mark - base64解密
/*!
 *  @author DT
 *
 *  @brief  返回Base64解码后的NSString字符串
 *
 *  @return NSString
 */
- (NSString *)base64DecodedString;

@end
