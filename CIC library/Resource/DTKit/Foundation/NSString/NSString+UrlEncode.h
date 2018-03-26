//
//  NSString+UrlEncode.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSString (UrlEncode)

#pragma mark - URL编码
/*!
 *  @author DT
 *
 *  @brief  URL编码
 *
 *  @return NSString
 */
- (NSString *)urlEncode;

/*!
 *  @author DT
 *
 *  @brief  URL编码
 *
 *  @param encoding 编码类型
 *
 *  @return NSString
 */
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;

#pragma mark - URL反编码
/*!
 *  @author DT
 *
 *  @brief  URL反编码
 *
 *  @return NSString
 */
- (NSString *)urlDecode;

/*!
 *  @author DT
 *
 *  @brief  URL反编码
 *
 *  @param encoding 编码类型
 *
 *  @return NSString
 */
- (NSString *)urlDecodeUsingEncoding:(NSStringEncoding)encoding;

#pragma mark - url数据转化成NSDictionary
/*!
 *  @author DT
 *
 *  @brief  获取url数据中参数
 *
 *  @return NSDictionary
 */
- (NSDictionary *)dictionaryFromURLParameters;

@end
