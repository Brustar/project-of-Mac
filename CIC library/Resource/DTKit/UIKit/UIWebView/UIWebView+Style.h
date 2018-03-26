//
//  UIWebView+style.h
//  vw-vip
//
//  Created by jakey on 14-3-11.
//  Copyright (c) 2014年 zhangkongli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (Style)

#pragma mark - 是否隐藏上下滚动出边界时的黑色的图片(也就是拖拽后的上下阴影)
- (void)setShadowViewHidden:(BOOL)b;

#pragma mark - 是否隐藏横向滚动条
- (void)setShowsHorizontalScrollIndicator:(BOOL)b;

#pragma mark - 是否隐藏纵向滚动条
- (void)setShowsVerticalScrollIndicator:(BOOL)b;

#pragma mark - 设置透明
-(void) makeTransparent;

#pragma mark - 设置透明和隐藏上下滚动出边界时的黑色的图片
-(void) makeTransparentAndRemoveShadow;
@end
