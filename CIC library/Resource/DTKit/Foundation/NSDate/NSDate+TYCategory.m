//
//  NSDate+TYCategory.m
//  SunCity-VIP
//
//  Created by Jerry on 14/11/16.
//  Copyright © 2016年 MT. All rights reserved.
//

#import "NSDate+TYCategory.h"
#import "NSDate+Utilities.h"
@implementation NSDate (TYCategory)

/**  获取月份英文
 @param isShort 是否为缩写  */
- (NSString *)ty_monthForShort:(BOOL)isShort {
    NSString *month = @"";
    month = [NSDate ty_monthForShort:isShort month:self.month];
    return month;
}
+ (NSString *)ty_monthForShort:(BOOL)isShort month:(NSInteger)monthInt {
    
    NSString *month;
    if (isShort) {
        month = [self getStortEngMothWithDateForInteger:monthInt];
    } else {
        month = [self getMothWithDateForInteger:monthInt];
    }
    return month;
}

+ (NSString *)getStortEngMothWithDateForInteger:(NSInteger)date
{
    NSString *monthStr;
    switch (date) {
        case 1:
            monthStr = @"JAN";
            break;
        case 2:
            monthStr = @"FEB";
            break;
        case 3:
            monthStr = @"MAR";
            break;
        case 4:
            monthStr = @"APR";
            break;
        case 5:
            monthStr = @"MAY";
            break;
        case 6:
            monthStr = @"JUN";
            break;
        case 7:
            monthStr = @"JUL";
            break;
        case 8:
            monthStr = @"AUG";
            break;
        case 9:
            monthStr = @"SEP";
            break;
        case 10:
            monthStr = @"OCT";
            break;
        case 11:
            monthStr = @"NOV";
            break;
        case 12:
            monthStr = @"DEC";
            break;
    }
    return monthStr;
}

+ (NSString *)getMothWithDateForInteger:(NSInteger)date
{
    
    NSString *langCode = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode];
    
    NSString *monthStr = @"";
    switch (date) {
        case 1:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_JAN", langCode, nil);
            break;
        case 2:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_FEB", langCode, nil);
            break;
        case 3:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_MAR", langCode, nil);
            break;
        case 4:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_APR", langCode, nil);
            break;
        case 5:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_MAY", langCode, nil);
            break;
        case 6:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_JUN", langCode, nil);
            break;
        case 7:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_JUL", langCode, nil);
            break;
        case 8:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_AUG", langCode, nil);
            break;
        case 9:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_SEP", langCode, nil);
            break;
        case 10:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_OCT", langCode, nil);
            break;
        case 11:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_NOV", langCode, nil);
            break;
        case 12:
            monthStr = NSLocalizedStringFromTable(@"UNIVERSAL_DEC", langCode, nil);
            break;
    }
    return monthStr;
}
/**  获取中文星期天数  */
- (NSString *)ty_weekDayInChinese {
    
    NSString *langCode = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode];
    
    NSString *weekDayKey = @"";
    switch (self.weekday) {
        case 1:
            weekDayKey = @"MAIN_HOTEL_SUN";
            break;
        case 2:
            weekDayKey = @"MAIN_HOTEL_MON";
            break;
        case 3:
            weekDayKey = @"MAIN_HOTEL_TUE";
            break;
        case 4:
            weekDayKey = @"MAIN_HOTEL_WED";
            break;
        case 5:
            weekDayKey = @"MAIN_HOTEL_THU";
            break;
        case 6:
            weekDayKey = @"MAIN_HOTEL_FRI";
            break;
        case 7:
            weekDayKey = @"MAIN_HOTEL_SAT";
            break;
        case 0:
            weekDayKey = @"MAIN_HOTEL_SUN";
            break;
    }
    NSString *weekDayStr = NSLocalizedStringFromTable(weekDayKey, langCode, nil);
    return weekDayStr;
}

/**  将一个日期字符串 转换格式  */
+ (NSString *)ty_formatWithDateStr:(NSString *)dateStr
                  fromFormatter:(NSString *)fromFormatter
                    toFormatter:(NSString *)toFormatter
{
    NSDate *date = [NSDate formatWithString:dateStr formatter:fromFormatter];
    NSString *finalDateStr = [date formatWithDate:toFormatter];
    return finalDateStr;
}

/**  将一个日期字符串 转换格式(东八区影响 RFC转换后减去8小时)  */
+ (NSString *)ty_formatWithRFC3339String:(NSString *)RFC3339String
                             toFormatter:(NSString *)toFormatter
{
    NSDate *date = [NSDate dateFromRFC3339String:RFC3339String];
    //date = [date dateByAddingHours:-8]; // 东八区转换成伦敦时间
    NSString *text = [date formatWithDate:toFormatter];
    return text;
}

@end
