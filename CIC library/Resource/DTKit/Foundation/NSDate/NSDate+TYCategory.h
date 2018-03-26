//
//  NSDate+TYCategory.h
//  SunCity-VIP
//
//  Created by Jerry on 14/11/16.
//  Copyright © 2016年 MT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TYCategory)

/**  获取月份英文
 @param isShort 是否为缩写  */
- (NSString *)ty_monthForShort:(BOOL)isShort;
+ (NSString *)ty_monthForShort:(BOOL)isShort month:(NSInteger)monthInt;
+ (NSString *)getMothWithDateForInteger:( NSInteger )date;
/**  获取中文星期天数  */
- (NSString *)ty_weekDayInChinese;


/**  将一个日期字符串 转换格式  */
+ (NSString *)ty_formatWithDateStr:(NSString *)dateStr
                  fromFormatter:(NSString *)fromFormatter
                    toFormatter:(NSString *)toFormatter;

/**  将一个日期字符串 转换格式(东八区影响 RFC转换后减去8小时)  */
+ (NSString *)ty_formatWithRFC3339String:(NSString *)RFC3339String
                             toFormatter:(NSString *)toFormatter;

@end
