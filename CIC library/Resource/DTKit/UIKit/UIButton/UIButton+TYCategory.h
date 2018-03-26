//
//  UIButton+TYCategory.h
//  SunCity-VIP
//
//  Created by Jerry on 4/11/16.
//  Copyright © 2016年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TYCategory)

/**  设置按钮里 图片&文字 之间的间隔  */
- (void)ty_setImageAndTextPadding:(CGFloat)padding;

/**  改变图片 & 文字方向(左文字右图片)  */
- (void)ty_changeDirectionWithPadding:(CGFloat)padding;

/**  上图片下文字  */
- (void)ty_verticalImageAndTitle:(CGFloat)spacing;

/**  添加垂直间隙  */
- (void)ty_addContentVerticalPadding:(CGFloat)padding;
- (void)ty_addContentVerticalTopPadding:(CGFloat)padding;
- (void)ty_addContentVerticalBottomPadding:(CGFloat)padding;

/**  添加水平间隙  */
- (void)ty_addContentHorizontalPadding:(CGFloat)padding;

@end
