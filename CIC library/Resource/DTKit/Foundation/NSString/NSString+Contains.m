//
//  NSString+Contains.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by 符现超 on 15/5/9.
//  Copyright (c) 2015年 http://weibo.com/u/1655766025 All rights reserved.
//

#import "NSString+Contains.h"

@implementation NSString (Contains)

///判断URL中是否包含中文
- (BOOL)isContainChinese
{
    NSUInteger length = [self length];
    for (NSUInteger i = 0; i < length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        const char *cString = [subString UTF8String];
        if (strlen(cString) == 3) {
            return YES;
        }
    }
    return NO;
}

///是否包含空格
- (BOOL)isContainBlank
{
    NSRange range = [self rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
}

//Unicode编码的字符串转成NSString
- (NSString *)makeUnicodeToString
{
    NSString *tempStr1 = [self stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    //NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    
    NSString *returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListMutableContainersAndLeaves format:NULL error:NULL];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}

- (BOOL)containsCharacterSet:(NSCharacterSet *)set
{
    NSRange rang = [self rangeOfCharacterFromSet:set];
    if (rang.location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}
/**
 *  @brief 是否包含字符串
 *
 *  @param string 字符串
 *
 *  @return YES, 包含; Otherwise
 */
- (BOOL)containsString:(NSString *)string
{
    NSRange rang = [self rangeOfString:string];
    if (rang.location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}

/**
 *  @brief 获取字符数量
 */
- (int)wordsCount
{
    NSInteger n = self.length;
    int i;
    int l = 0, a = 0, b = 0;
    unichar c;
    for (i = 0; i < n; i++)
    {
        c = [self characterAtIndex:i];
        if (isblank(c)) {
            b++;
        } else if (isascii(c)) {
            a++;
        } else {
            l++;
        }
    }
    if (a == 0 && l == 0) {
        return 0;
    }
    return l + (int)ceilf((float)(a + b) / 2.0);
}

- (NSString *)toFormatNumberString
{
    @try
    {
        if ([self rangeOfString:@","].location != NSNotFound) {
            return self;
        }
        
        NSArray *numArray = [self componentsSeparatedByString:@"."];
        
        NSString *numInt = [numArray objectAtIndex:0];
        BOOL isNegative = NO;
        if ([numInt doubleValue] < 0) {
            isNegative = YES;
            numInt = [NSString stringWithFormat:@"%lld", [numInt longLongValue]*(-1)];
        }
        
        NSString *suffixStr = @"";
        if ([numArray count] == 1) { // 如果没有小数点 补全
            suffixStr = [NSString stringWithFormat:@".00"];
        }
        else { // 有小数点
            NSString *dotNum = [numArray objectAtIndex:1];
            
            while ([dotNum hasSuffix:@"0"]) {
                if ([dotNum isEqualToString:@"00"]) {
                    break;
                }
                dotNum = [dotNum substringToIndex:dotNum.length-1];
            }
            if ([dotNum length] > 0) {
                suffixStr = [NSString stringWithFormat:@".%@", dotNum];
            }
            if ([dotNum length] == 1) {
                suffixStr = [NSString stringWithFormat:@".%@0", dotNum];
            }
            if ([dotNum length] > 2) { // 小数位超兩位的
                suffixStr = [NSString stringWithFormat:@".%@", [dotNum substringWithRange:NSMakeRange(0, 2)]];
            }
        }
        
        if (numInt.length > 3) {
            NSMutableArray *numArr = [[NSMutableArray alloc] init];
            while (numInt.length > 3){
                NSString *temp = [numInt substringFromIndex:numInt.length - 3];
                numInt = [numInt substringToIndex:numInt.length - 3];
                [numArr addObject:[NSString stringWithFormat:@",%@",temp]];//得到的倒序的数据
            }
            NSInteger count = [numArr count];
            for (int i = 0; i < count; i++){
                numInt = [numInt stringByAppendingFormat:@"%@",[numArr objectAtIndex:(count -1 -i)]];
            }
        }
        
        NSString *numStr = @"";
        if (isNegative) {
            numStr = [NSString stringWithFormat:@"-%@%@",numInt,suffixStr];
        }else{
            numStr = [NSString stringWithFormat:@"%@%@",numInt,suffixStr];
        }
        return numStr;
    }
    @catch (NSException *exception)
    {
        return self;
    }
    @finally
    {}
}

+ (NSString *)getLocateCode
{
    NSString *locateCode = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageCode];
    
    if ([locateCode isEqualToString:@"English"]) {
        locateCode = @"en";
    }else if ([locateCode isEqualToString:@"Simplified"]) {
        locateCode = @"zh_HK";
    }else{
        locateCode = @"zh_CN";
    }
    
    return locateCode;
}

@end
