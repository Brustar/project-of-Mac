//
//  NSString+Matcher.h
//  Whyd
//
//  Created by Damien Romito on 29/01/15.
//  Copyright (c) 2015 Damien Romito. All rights reserved.
//
//https://github.com/damienromito/NSString-Matcher
#import <Foundation/Foundation.h>

/*!
 *  @author DT
 *
 *  @brief  NSString的正则表达式匹配
 */
@interface NSString(Matcher)

#pragma mark - 获取NSString数据包含正则表达式所匹配到的数据
/*!
 *  @author DT
 *
 *  @brief  返回正则表达式所匹配到的NSString集合
 *
 *  @param regex 正则表达式
 *
 *  @return NSArray
 */
- (NSArray *)matchWithRegex:(NSString *)regex;

/*!
 *  @author DT
 *
 *  @brief  返回正则表达式所匹配到的NSString
 *
 *  @param regex 正则表达式
 *  @param index 获取NSString集合中的第几个元素
 *
 *  @return NSString
 */
- (NSString *)matchWithRegex:(NSString *)regex atIndex:(NSUInteger)index;

/*!
 *  @author DT
 *
 *  @brief  返回正则表达式所匹配到的NSString
 *
 *  @param regex 正则表达式
 *
 *  @return 获取NSString集合中的第1个元素
 */
- (NSString *)firstMatchedGroupWithRegex:(NSString *)regex;

/*!
 *  @author DT
 *
 *  @brief  返回包含正则表达式所匹配到的NSString的NSTextCheckingResult对象
 *
 *  @param regex 正则表达式
 *
 *  @return NSTextCheckingResult对象
 */
- (NSTextCheckingResult *)firstMatchedResultWithRegex:(NSString *)regex;

@end