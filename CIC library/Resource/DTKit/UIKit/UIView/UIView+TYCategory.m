//
//  UIView+TYCategory.m
//  SunCity-VIP
//
//  Created by Jerry on 11/2/17.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "UIView+TYCategory.h"

@implementation UIView (TYCategory)

#pragma mark - raduis

- (void)ty_setCornerRadius:(CGFloat)radius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

- (void)ty_setBorderWidth:(CGFloat)width color:(UIColor *)color
{
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
}

#pragma mark - shadow

- (void)ty_setShadowWithOffset:(CGSize)offset
{
    if (CGSizeEqualToSize(offset, CGSizeZero)) {
        offset = CGSizeMake(3, 3);
    }
    self.layer.shadowOffset = offset;// 设置阴影的偏移量
    self.layer.shadowRadius = 10.0;// 设置阴影的半径
    self.layer.shadowColor = [UIColor blackColor].CGColor;// 设置阴影的颜色为黑色
    self.layer.shadowOpacity = 0.9;// 设置阴影的不透明度
}

#pragma mark - layoutAnimation

+ (void)ty_autoLayoutView:(UIView *)view
                animation:(void (^)(void))animation
               completion:(void (^)(BOOL finished))completion
{
    [view.superview layoutIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        if (animation) {
            animation();
        }
        [view.superview layoutIfNeeded];
    } completion:completion];
}

+ (void)ty_autoLayoutView:(UIView *)view
                animation:(void (^)(void))animation
{
    [self ty_autoLayoutView:view animation:animation completion:nil];
}

@end
