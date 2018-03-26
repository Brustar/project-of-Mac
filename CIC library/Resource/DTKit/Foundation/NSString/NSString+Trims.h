//
//  NSString+Trims.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/3/29.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Trims)

#pragma mark - 去掉html标签
/** 去掉html标签 */
- (NSString *)stringByStrippingHTML;

#pragma mark - 去掉html标签跟script标签
/** 去掉html标签跟script标签 */
- (NSString *)stringByRemovingScriptsAndStrippingHTML;

#pragma mark - 去掉两端空格,不包括回车
/** 去掉两端空格,不包括回车 */
- (NSString *)trimmingWhitespace;

#pragma mark - 去掉两端空格,包括回车
/** 去掉两端空格,包括回车 */
- (NSString *)trimmingWhitespaceAndNewlines;

@end
