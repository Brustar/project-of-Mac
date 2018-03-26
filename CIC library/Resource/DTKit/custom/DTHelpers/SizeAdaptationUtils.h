//
//  SizeAdaptationUtils.h
//  Vmei
//
//  Created by DT on 15/8/1.
//  Copyright (c) 2015年 com.vmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*!
 *  @author DT
 *
 *  @brief  根据屏幕等比放大缩小
 */

#pragma mark - 值按375屏幕等比放大缩小
/*!
 *  @author DT
 *
 *  @brief  值按375屏幕等比放大缩小
 *
 *  @param size 原始值
 *
 *  @return 等比放大缩小后的值
 */
CGFloat adjustsSizeToFitWidth375(CGFloat size);

#pragma mark - 值按750屏幕等比放大缩小
/*!
 *  @author DT
 *
 *  @brief  值按750屏幕等比放大缩小
 *
 *  @param size 原始值
 *
 *  @return 等比放大缩小后的值
 */
CGFloat adjustsSizeToFitWidth750(CGFloat size);

#pragma mark - UIFont按375屏幕等比放大缩小
/*!
 *  @author DT
 *
 *  @brief  按屏幕宽度返回UIFont
 *
 *  @param pix 原始值
 *
 *  @return UIFont
 */
UIFont* adjustsSizeToFitFont(CGFloat pix);

#pragma mark - UIFont按375屏幕等比放大缩小
/*!
 *  @author DT
 *
 *  @brief  按屏幕宽度返回加粗UIFont
 *
 *  @param pix 原始值
 *
 *  @return UIFont
 */
UIFont* adjustsSizeToFitBoldFont(CGFloat pix);

