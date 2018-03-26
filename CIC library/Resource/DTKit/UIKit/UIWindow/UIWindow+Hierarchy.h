//
//  UIWindow+Hierarchy.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/16.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Hierarchy)

#pragma mark - 获取UIWindow最上层的UIViewController
/*!
 *  @author DT
 *
 *  @brief  获取最上层的UIViewController
 *
 *  @return UIViewController
 */
- (UIViewController*) topMostController;

#pragma mark - 获取UIWindow当前的UIViewController
/*!
 *  @author DT
 *
 *  @brief  获取当前的UIViewController
 *
 *  @return UIViewController
 */
- (UIViewController*)currentViewController;
@end
