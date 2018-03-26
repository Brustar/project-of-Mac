//
//  UIColor+Web.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/22.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Web)

#pragma mark - 获取canvas用的颜色字符串
/*!
 *  @author DT, 15-09-02 11:09:40
 *
 *  @brief  获取canvas用的颜色字符串
 *
 *  @return 16进制的颜色字符串
 */
- (NSString *)canvasColorString;

#pragma mark - 获取网页颜色字串
/*!
 *  @author DT, 15-09-02 11:09:52
 *
 *  @brief  获取网页颜色字串
 *
 *  @return 16进制的颜色字符串
 */
- (NSString *)webColorString;

@end
