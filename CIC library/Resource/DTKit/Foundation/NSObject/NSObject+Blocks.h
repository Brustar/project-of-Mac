//
//  NSObject+Blocks.h
//  PSFoundation
//
//  Created by Peter Steinberger on 24.10.10.
//  Copyright 2010 Peter Steinberger. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSObject (Blocks)

#pragma mark - 定时器(不可循环,不带参数)
/*!
 *  @author DT
 *
 *  @brief  delay秒后执行回调
 *
 *  @param block 回调函数
 *  @param delay 秒
 *
 *  @return
 */
+ (id)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

/*!
 *  @author DT
 *
 *  @brief  delay秒后执行回调
 *
 *  @param block 回调函数
 *  @param delay 秒
 *
 *  @return
 */
- (id)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

#pragma mark - 定时器(不可循环,可带参数)
/*!
 *  @author DT
 *
 *  @brief  delay秒后执行回调,带参数
 *
 *  @param withObject 参数
 *  @param block      回调函数
 *  @param delay      秒
 *
 *  @return
 */
+ (id)performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;

/*!
 *  @author DT
 *
 *  @brief  delay秒后执行回调,带参数
 *
 *  @param withObject 参数
 *  @param block      回调函数
 *  @param delay      秒
 *
 *  @return
 */
- (id)performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;

@end
