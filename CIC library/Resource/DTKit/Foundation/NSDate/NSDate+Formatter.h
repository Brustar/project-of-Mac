//
//  NSDate+Formatter.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Copyright (C) 2013 by Christopher Meyer
//  http://schwiiz.org/
//

#import <Foundation/Foundation.h>

//  GMT 0:00 格林威治标准时间; UTC +00:00 校准的全球时间; CCD +08:00 中国标准时间

@interface NSDate (Formatter)

+(NSDateFormatter *)formatter;
+(NSDateFormatter *)formatterWithoutTime;
+(NSDateFormatter *)formatterWithoutDate;

#pragma mark - NSDate类型日期转化成NSString类型日期
/*!
 *  @author DT
 *
 *  @brief  NSDate类型日期转化成NSString类型日期
 *
 *  @param formatter 日期格式
 *
 *  @return NSString
 */
-(NSString*)formatWithDate:(NSString*)formatter;

/*!
 *  @author DT
 *
 *  @brief  NSDate类型日期转化成NSString类型日期
 *
 *  @param formatter 日期格式
 *
 *  @return NSString
 */
+(NSString*)formatWithDate:(NSString*)formatter;

#pragma mark - NSString类型日期转化成NSDate类型日期
/*!
 *  @author DT
 *
 *  @brief  NSString类型日期转化成NSDate类型日期
 *
 *  @param string    NSString类型日期
 *  @param formatter 日期格式
 *
 *  @return NSDate
 */
+(NSDate*)formatWithString:(NSString*)string formatter:(NSString*)formatter;

#pragma mark - 显示如"前天 下午3:01"、"昨天 下午3:01"、"明天 下午3:01"、"后天 下午3:01"、"2015年8月22日 下午3:07"的字符串
/*!
 *  @author DT
 *
 *  @brief  返回UTC时区时间的指定格式字符串
 *
 *  @return 如"前天 下午3:01"、"昨天 下午3:01"、"明天 下午3:01"、"后天 下午3:01"、"2015年8月22日 下午3:07"
 */
-(NSString *)formatWithUTCTimeZone;

/*!
 *  @author DT
 *
 *  @brief  返回本地时区时间的指定格式字符串
 *
 *  @return 如"前天 下午3:01"、"昨天 下午3:01"、"明天 下午3:01"、"后天 下午3:01"、"2015年8月22日 下午3:07"
 */
-(NSString *)formatWithLocalTimeZone;

/*!
 *  @author DT
 *
 *  @brief  返回UTC时区时间的指定格式字符串
 *
 *  @param offset 偏移量,以为毫秒为单位
 *
 *  @return 如"前天 下午3:01"、"昨天 下午3:01"、"明天 下午3:01"、"后天 下午3:01"、"2015年8月22日 下午3:07"
 */
-(NSString *)formatWithTimeZoneOffset:(NSTimeInterval)offset;

/*!
 *  @author DT
 *
 *  @brief  返回时间的指定格式字符串
 *
 *  @param timezone 时区对象
 *
 *  @return 如"前天 下午3:01"、"昨天 下午3:01"、"明天 下午3:01"、"后天 下午3:01"、"2015年8月22日 下午3:07"
 */
-(NSString *)formatWithTimeZone:(NSTimeZone *)timezone;

#pragma mark - 显示如"前天"、"昨天"、"明天"、"后天"、"2015年8月22日"的字符串
/*!
 *  @author DT
 *
 *  @brief  返回UTC时区时间的指定格式字符串
 *
 *  @return 如"前天"、"昨天"、"明天"、"后天"、"2015年8月22日"
 */
-(NSString *)formatWithUTCTimeZoneWithoutTime;

/*!
 *  @author DT
 *
 *  @brief  返回本地时区时间的指定格式字符串
 *
 *  @return 如"前天"、"昨天"、"明天"、"后天"、"2015年8月22日"
 */
-(NSString *)formatWithLocalTimeZoneWithoutTime;

/*!
 *  @author DT
 *
 *  @brief  返回UTC时区时间的指定格式字符串
 *
 *  @param offset 偏移量,以为毫秒为单位
 *
 *  @return 如"前天"、"昨天"、"明天"、"后天"、"2015年8月22日"
 */
-(NSString *)formatWithTimeZoneOffsetWithoutTime:(NSTimeInterval)offset;

/*!
 *  @author DT
 *
 *  @brief  返回时间的指定格式字符串
 *
 *  @param timezone 时区对象
 *
 *  @return 如"前天"、"昨天"、"明天"、"后天"、"2015年8月22日"
 */
-(NSString *)formatWithTimeZoneWithoutTime:(NSTimeZone *)timezone;

#pragma mark - 显示如"下午3:01"、"下午3:01"、"下午3:01"、"下午3:01"、"下午3:07"的字符串
/*!
 *  @author DT
 *
 *  @brief  返回UTC时区时间的指定格式字符串
 *
 *  @return 如"下午3:01"、"下午3:01"、"下午3:01"、"下午3:01"、"下午3:07"
 */
-(NSString *)formatWithUTCWithoutDate;

/*!
 *  @author DT
 *
 *  @brief  返回本地时区时间的指定格式字符串
 *
 *  @return 如"下午3:01"、"下午3:01"、"下午3:01"、"下午3:01"、"下午3:07"
 */
-(NSString *)formatWithLocalTimeWithoutDate;

/*!
 *  @author DT
 *
 *  @brief  返回UTC时区时间的指定格式字符串
 *
 *  @param offset 偏移量,以为毫秒为单位
 *
 *  @return 如"下午3:01"、"下午3:01"、"下午3:01"、"下午3:01"、"下午3:07"
 */
-(NSString *)formatWithTimeZoneOffsetWithoutDate:(NSTimeInterval)offset;

/*!
 *  @author DT
 *
 *  @brief  返回时间的指定格式字符串
 *
 *  @param timezone 时区对象
 *
 *  @return 如"下午3:01"、"下午3:01"、"下午3:01"、"下午3:01"、"下午3:07"
 */
-(NSString *)formatTimeWithTimeZone:(NSTimeZone *)timezone;

@end
