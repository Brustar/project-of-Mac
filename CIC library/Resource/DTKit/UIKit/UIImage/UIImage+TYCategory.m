//
//  UIImage+TYCategory.m
//  SunCity-VIP
//
//  Created by Jerry on 18/7/17.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "UIImage+TYCategory.h"

@implementation UIImage (TYCategory)

- (UIImage *)ty_resizableImageInCenter
{
    UIImage *inpugImage = self;
    CGFloat top = inpugImage.size.height/2.0; // 顶端盖高度
    CGFloat bottom = top ; // 底端盖高度
    CGFloat left = inpugImage.size.width/2.0; // 左端盖宽度
    CGFloat right = left; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    inpugImage = [inpugImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeTile];
    return inpugImage;
}

@end
