//
//  UIBarButtonItem+Action.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BarButtonActionBlock)();

@interface UIBarButtonItem (Action)

#pragma mark - 为UIBarButtonItem增加点击事件
/*!
 *  @author DT
 *
 *  @brief  为UIBarButtonItem增加点击事件
 *
 *  @param actionBlock 回调函数
 */
- (void)setActionBlock:(BarButtonActionBlock)actionBlock;

#pragma mark - 增加UIBarButtonItem初始方法
/*!
 *  @author DT
 *
 *  @brief  增加UIBarButtonItem初始方法
 *
 *  @param title       标题
 *  @param actionBlock 回调函数
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem*)initWithTitle:(NSString*)title action:(BarButtonActionBlock)actionBlock;

@end
