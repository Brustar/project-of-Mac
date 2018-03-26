//
//  NSDate+InternetDateTime.h
//  MWFeedParser
//
//  Created by Michael Waterfall on 07/10/2010.
//  Copyright 2010 Michael Waterfall. All rights reserved.
//

#import <Foundation/Foundation.h>

// Formatting hints
typedef enum {
    DateFormatHintNone, 
    DateFormatHintRFC822, //RFC8222格式：Fri, 30 Mar 2012 05:14:40 +0000 后面的 +0000 代表的是时区
    DateFormatHintRFC3339 //RFC3339格式：2007-05-01T15:43:26.3452-07:00
} DateFormatHint;

// A category to parse internet date & time strings
@interface NSDate (InternetDateTime)

#pragma mark - RFC8222格式或者RFC3339格式的字符串日期转化成NSDate
/*!
 *  @author DT
 *
 *  @brief  日期字符串转化成NSDate
 *
 *  @param dateString 日期字符串
 *  @param hint       转化类型
 *
 *  @return
 */
+ (NSDate *)dateFromInternetDateTimeString:(NSString *)dateString 
                                formatHint:(DateFormatHint)hint;

#pragma mark - RFC3339格式的字符串日期转化成NSDate
/*!
 *  @author DT
 *
 *  @brief  RFC8222格式的日期字符串转化成NSDate
 *
 *  @param dateString RFC8222格式日期字符串
 *
 *  @return NSDate
 */
+ (NSDate *)dateFromRFC3339String:(NSString *)dateString;

#pragma mark - RFC8222格式的字符串日期转化成NSDate
/*!
 *  @author DT
 *
 *  @brief  RFC3339格式的日期字符串转化成NSDate
 *
 *  @param dateString RFC3339格式日期字符串
 *
 *  @return NSDate
 */
+ (NSDate *)dateFromRFC822String:(NSString *)dateString;

@end
