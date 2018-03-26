//
//  NSURL+Param.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Param)

#pragma mark - url转NSDictionary
/*!
 *  @author DT
 *
 *  @brief  url转NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *)parameters;

#pragma mark - 获取url中key的值
/*!
 *  @author DT
 *
 *  @brief  获取url中某个key的值
 *
 *  @param parameterKey key
 *
 *  @return NSString
 */
- (NSString *)valueForParameter:(NSString *)parameterKey;

@end
