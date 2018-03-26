// NSDate+CupertinoYankee.h
//
// Copyright (c) 2012 Mattt Thompson (http://mattt.me)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>

/*!
 *  @author DT
 *
 *  @brief  NSDate日期计算的分类
 */
@interface NSDate (CupertinoYankee)

#pragma mark - 获取日期时间为00:00:00时候的日期
/*!
 *  @author DT
 *
 *  @brief  获取当前日期时间为00:00:00时候的日期
 *
 *  @return
 */
+ (NSDate *)beginningOfDay;

/*!
 *  @author DT
 *
 *  @brief  获取指定日期时间为00:00:00时候的日期
 *
 *  @return
 */
- (NSDate *)beginningOfDay;


#pragma mark - 获取日期时间为23:59:59时候的日期
/*!
 *  @author DT
 *
 *  @brief  获取当前日期时间为23:59:59时候的日期
 *
 *  @return
 */
+ (NSDate *)endOfDay;

/*!
 *  @author DT
 *
 *  @brief  获取指定日期时间为23:59:59时候的日期
 *
 *  @return
 */
- (NSDate *)endOfDay;


#pragma mark - 获取周一时间为00:00:00时候的日期
/*!
 *  @author DT
 *
 *  @brief  获取当前日期周一时间为00:00:00时候的日期
 *
 *  @return
 */
+ (NSDate *)beginningOfWeek;

/*!
 *  @author DT
 *
 *  @brief  获取指定日期周一时间为00:00:00时候的日期
 *
 *  @return
 */
- (NSDate *)beginningOfWeek;


#pragma mark - 获取周日时间为23:59:59时候的日期
/*!
 *  @author DT
 *
 *  @brief  获取当前日期周日时间为23:59:59时候的日期
 *
 *  @return
 */
+ (NSDate *)endOfWeek;

/*!
 *  @author DT
 *
 *  @brief  获取指定日期周日时间为23:59:59时候的日期
 *
 *  @return
 */
- (NSDate *)endOfWeek;


#pragma mark - 获取本月第一天时间为00:00:00时候的日期
/*!
 *  @author DT
 *
 *  @brief  获取当前日期本月第一天时间为00:00:00时候的日期
 *
 *  @return
 */
+ (NSDate *)beginningOfMonth;

/*!
 *  @author DT
 *
 *  @brief  获取指定日期本月第一天时间为00:00:00时候的日期
 *
 *  @return
 */
- (NSDate *)beginningOfMonth;


#pragma mark - 获取本月最后一天时间为23:59:59时候的日期
/*!
 *  @author DT
 *
 *  @brief  获取当前日期本月最后一天时间为23:59:59时候的日期
 *
 *  @return
 */
+ (NSDate *)endOfMonth;

/*!
 *  @author DT
 *
 *  @brief  获取指定日期本月最后一天时间为23:59:59时候的日期
 *
 *  @return
 */
- (NSDate *)endOfMonth;


#pragma mark - 获取本年第一天时间为00:00:00时候的日期
/*!
 *  @author DT
 *
 *  @brief  获取当前日期本年第一天时间为00:00:00时候的日期
 *
 *  @return
 */
+ (NSDate *)beginningOfYear;

/*!
 *  @author DT
 *
 *  @brief  获取指定日期本年第一天时间为00:00:00时候的日期
 *
 *  @return
 */
- (NSDate *)beginningOfYear;


#pragma mark - 获取本年最后一天时间为23:59:59时候的日期
/*!
 *  @author DT
 *
 *  @brief  获取当前日期本年最后一天时间为23:59:59时候的日期
 *
 *  @return
 */
+ (NSDate *)endOfYear;

/*!
 *  @author DT
 *
 *  @brief  获取指定日期本年最后一天时间为23:59:59时候的日期
 *
 *  @return
 */
- (NSDate *)endOfYear;

@end
