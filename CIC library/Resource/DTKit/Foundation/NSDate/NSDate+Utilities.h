//
//  NSDate+Utilities.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

#define D_MINUTE	60
#define D_HOUR	3600
#define D_DAY	86400
#define D_WEEK	604800
#define D_YEAR	31556926

@interface NSDate (Utilities)

+ (NSCalendar *) currentCalendar; // avoid bottlenecks

#pragma mark - 获取明天日期
/** 获取明天日期 */
+ (NSDate *) dateTomorrow;

#pragma mark - 获取昨天日期
/** 获取昨天日期 */
+ (NSDate *) dateYesterday;

#pragma mark - 获取指定天数的日期字符串yyyy-MM-dd
/** 获取指定天数的日期yyyy-MM-dd */
+ (NSString *) dateDaysString:(NSInteger)days;
/** 获取明天日期yyyy-MM-dd */
+ (NSString *) dateTomorrowString;
/** 获取昨天日期yyyy-MM-dd */
//+ (NSString *) dateYesterdayString;
/** 获取今天日期yyyy-MM-dd */
+ (NSString *) dateTodayString;


#pragma mark - 获取几天后日期
/** 获取几天后日期 */
+ (NSDate *) dateWithDaysFromNow: (NSInteger) days;
/** 获取几天后日期 */
- (NSDate *) dateByAddingDays: (NSInteger) dDays;

#pragma mark - 获取几天前日期
/** 获取几天前日期 */
+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days;
/** 获取几天前日期 */
- (NSDate *) dateBySubtractingDays: (NSInteger) dDays;

#pragma mark - 获取几小时后日期
/** 获取几小时后日期 */
+ (NSDate *) dateWithHoursFromNow: (NSInteger) dHours;
/** 获取几小时后日期 */
- (NSDate *) dateByAddingHours: (NSInteger) dHours;

#pragma mark - 获取几小时前日期
/** 获取几小时前日期 */
+ (NSDate *) dateWithHoursBeforeNow: (NSInteger) dHours;
/** 获取几小时前日期 */
- (NSDate *) dateBySubtractingHours: (NSInteger) dHours;

#pragma mark - 获取几分钟后日期
/** 获取几分钟后日期 */
+ (NSDate *) dateWithMinutesFromNow: (NSInteger) dMinutes;
/** 获取几分钟后日期 */
- (NSDate *) dateByAddingMinutes: (NSInteger) dMinutes;

#pragma mark - 获取几分钟前日期
/** 获取几分钟前日期 */
+ (NSDate *) dateWithMinutesBeforeNow: (NSInteger) dMinutes;
/** 获取几分钟前日期*/
- (NSDate *) dateBySubtractingMinutes: (NSInteger) dMinutes;

#pragma mark - 获取几年后日期
/** 获取几年后日期 */
- (NSDate *) dateByAddingYears: (NSInteger) dYears;

#pragma mark - 获取几年前日期
/** 获取几年前日期 */
- (NSDate *) dateBySubtractingYears: (NSInteger) dYears;

#pragma mark - 获取几个月后日期
/** 获取几个月后日期 */
- (NSDate *) dateByAddingMonths: (NSInteger) dMonths;

#pragma mark - 获取几个月前日期
/** 获取几个月前日期 */
- (NSDate *) dateBySubtractingMonths: (NSInteger) dMonths;

#pragma mark - 获取上一天日期
/** 获取上一天日期 */
- (NSDate *) dateAtStartOfDay;

#pragma mark - 获取下一天日期
/** 获取下一天日期 */
- (NSDate *) dateAtEndOfDay;

#pragma mark - 获取与指定时间的秒差
/** 获取与指定时间的秒差 */
- (NSTimeInterval) secondAfterDate: (NSDate *) aDate;
/** 获取与指定时间的秒差 */
- (NSTimeInterval) secondBeforeDate: (NSDate *) aDate;

#pragma mark - 获取与指定时间的分钟差
/** 获取与指定时间的分钟差 */
- (NSInteger) minutesAfterDate: (NSDate *) aDate;
/** 获取与指定时间的分钟差 */
- (NSInteger) minutesBeforeDate: (NSDate *) aDate;

#pragma mark - 获取与指定时间的小时差
/** 获取与指定时间的小时差 */
- (NSInteger) hoursAfterDate: (NSDate *) aDate;
/** 获取与指定时间的小时差 */
- (NSInteger) hoursBeforeDate: (NSDate *) aDate;

#pragma mark - 获取与指定时间的天数差
/** 获取与指定时间的天数差 */
- (NSInteger) daysAfterDate: (NSDate *) aDate;
/** 获取与指定时间的天数差 */
- (NSInteger) daysBeforeDate: (NSDate *) aDate;

#pragma mark - 获取一年中的总天数
/** 获取一年中的总天数 */
- (NSUInteger)daysInYear;
/** 获取一年中的总天数 */
+ (NSUInteger)daysInYear;

#pragma mark - 获取当前月份的天数
/** 获取当前月份的天数 */
- (NSUInteger)daysInMonth;
/** 获取当前月份的天数 */
+ (NSUInteger)daysInMonth;

#pragma mark - 获取该日期是该年的第几周
/** 获取该日期是该年的第几周 */
- (NSUInteger)weekOfYear;
/** 获取该日期是该年的第几周 */
+ (NSUInteger)weekOfYear;

#pragma mark - 返回当前月一共有几周
/** 返回当前月一共有几周(可能为4,5,6) */
- (NSUInteger)weeksOfMonth;
/** 返回当前月一共有几周(可能为4,5,6) */
+ (NSUInteger)weeksOfMonth;

#pragma mark - 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
/** 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前 */
- (NSString *)timeInfo;

#pragma mark - 获取小时
/** 获取小时 */
@property (readonly) NSInteger hour;

#pragma mark - 获取分钟
/** 获取分钟 */
@property (readonly) NSInteger minute;

#pragma mark - 获取秒
/** 获取秒 */
@property (readonly) NSInteger seconds;

#pragma mark - 获取天
/** 获取天 */
@property (readonly) NSInteger day;

#pragma mark - 获取月
/** 获取月 */
@property (readonly) NSInteger month;

#pragma mark - 获取周
/** 获取周 */
@property (readonly) NSInteger weekday;

#pragma mark - 获取天
/** 获取天 */
@property (readonly) NSInteger year;

@end
