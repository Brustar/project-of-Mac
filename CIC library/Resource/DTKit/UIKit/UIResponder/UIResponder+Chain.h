//
//  UIResponder+Chain.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Chain)

#pragma mark - 显示UIResponder的层次链
/*!
 *  @author DT
 *
 *  @brief  显示UIResponder的层次链
 *
 *  @return NSString
 */
- (NSString *)responderChainDescription;

@end
