//
//  UIView+TYCategory.h
//  SunCity-VIP
//
//  Created by Jerry on 11/2/17.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TYCategory)

#pragma mark - raduis 

- (void)ty_setCornerRadius:(CGFloat)radius;

- (void)ty_setBorderWidth:(CGFloat)width color:(UIColor *)color;

#pragma mark - shadow

/**  设置阴影 默认则传CGSizeZero  */
- (void)ty_setShadowWithOffset:(CGSize)offset;

#pragma mark - layoutAnimation

+ (void)ty_autoLayoutView:(UIView *)view
                animation:(void (^)(void))animation
               completion:(void (^)(BOOL finished))completion;

+ (void)ty_autoLayoutView:(UIView *)view
                animation:(void (^)(void))animation;

@end
