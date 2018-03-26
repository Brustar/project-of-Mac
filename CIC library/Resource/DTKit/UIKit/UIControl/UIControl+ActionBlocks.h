//
//  UIControl+ActionBlocks.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//  https://github.com/lavoy/ALActionBlocks

#import <UIKit/UIKit.h>

typedef void (^UIControlActionBlock)(id sender);

@interface UIControlActionBlockWrapper : NSObject

@property (nonatomic, copy) UIControlActionBlock actionBlock;
@property (nonatomic, assign) UIControlEvents controlEvents;

- (void)invokeBlock:(id)sender;

@end

/*!
 *  @author DT
 *
 *  @brief  UIControl的分类,主要增加控件触发
 */
@interface UIControl (ActionBlocks)

#pragma mark - 增加控件触发
/*!
 *  @author DT
 *
 *  @brief  增加控件触发
 *
 *  @param controlEvents 控件类型
 *  @param actionBlock   控件对象
 */
- (void)handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControlActionBlock)actionBlock;

#pragma mark - 移除触发控件
/*!
 *  @author DT
 *
 *  @brief  移除触发控件
 *
 *  @param controlEvents 控件类型
 */
- (void)removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;

@end
