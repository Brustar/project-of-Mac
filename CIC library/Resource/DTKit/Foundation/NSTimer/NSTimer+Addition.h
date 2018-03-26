//
//  NSTimer+Addition.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)

#pragma mark - 暂停定时器
/*!
 *  @author DT
 *
 *  @brief  定时器暂停
 */
- (void)pauseTimer;

#pragma mark - 继续定时器
/*!
 *  @author DT
 *
 *  @brief  定时器继续
 */
- (void)resumeTimer;

#pragma mark - 于多少毫秒后继续定时器
/*!
 *  @author DT
 *
 *  @brief  定时器于多少毫秒后继续
 *
 *  @param interval 毫秒
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end
