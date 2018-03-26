//
//  NSDate+Judge.h
//  uikitDemo
//
//  Created by DT on 15/8/25.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Judge)

#pragma mark - 是否闰年
/** 是否闰年 */
+ (BOOL)isLeapYear;
/** 是否闰年 */
- (BOOL)isLeapYear;

#pragma mark - 是否同一天
/** 是否同一天 */
+ (BOOL)isSameDay:(NSDate *)anotherDate;
/** 是否同一天 */
- (BOOL)isSameDay:(NSDate *)anotherDate;

#pragma mark - 是否今天
/** 是否今天 */
- (BOOL)isToday;

#pragma mark - 是否明天
/** 是否明天 */
- (BOOL) isTomorrow;

#pragma mark - 是否昨天
/** 是否昨天 */
- (BOOL) isYesterday;

#pragma mark - 是否同一周
/** 是否同一周 */
- (BOOL) isSameWeek: (NSDate *) aDate;

#pragma mark - 是否这一周
/** 是否这一周 */
- (BOOL) isThisWeek;

#pragma mark - 是否下一周
/** 是否下一周 */
- (BOOL) isNextWeek;

#pragma mark - 是否上一周
/** 是否上一周 */
- (BOOL) isLastWeek;

#pragma mark - 是否同一个月
/** 是否同一个月 */
- (BOOL) isSameMonth: (NSDate *) aDate;

#pragma mark - 是否这个月
/** 是否这个月 */
- (BOOL) isThisMonth;

#pragma mark - 是否下个月
/** 是否下个月 */
- (BOOL) isNextMonth;

#pragma mark - 是否上个月
/** 是否上个月 */
- (BOOL) isLastMonth;

#pragma mark - 是否同一年
/** 是否同一年 */
- (BOOL) isSameYear: (NSDate *) aDate;

#pragma mark - 是否今年
/** 是否今年*/
- (BOOL) isThisYear;

#pragma mark - 是否明年
/** 是否明年 */
- (BOOL) isNextYear;

#pragma mark - 是否去年
/** 是否去年 */
- (BOOL) isLastYear;

#pragma mark - 是否未来
/** 是否未来 */
- (BOOL) isInFuture;

#pragma mark - 是否过去
/** 是否过去 */
- (BOOL) isInPast;

#pragma mark - 是否工作日
/** 是否工作日 */
- (BOOL) isTypicallyWorkday;

#pragma mark - 是否周末
/** 是否周末 */
- (BOOL) isTypicallyWeekend;

- (BOOL) isEarlierThanDate: (NSDate *) aDate;
- (BOOL) isLaterThanDate: (NSDate *) aDate;

@end
