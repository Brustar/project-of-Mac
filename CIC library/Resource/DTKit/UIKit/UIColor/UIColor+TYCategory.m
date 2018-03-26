//
//  UIColor+TYCategory.m
//  ERP
//
//  Created by Jerry on 3/7/17.
//  Copyright © 2017年 soonest. All rights reserved.
//

#import "UIColor+TYCategory.h"

@implementation UIColor (TYCategory)

+ (instancetype)ty_colorWithW:(CGFloat)W
{
    return [self ty_colorWithW:W A:1.0];
}

+ (instancetype)ty_colorWithW:(CGFloat)W A:(CGFloat)A
{
    return [UIColor colorWithWhite:W/255.0 alpha:A];
}

+ (instancetype)ty_colorWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B
{
    return [self ty_colorWithR:R G:G B:B A:1.0];
}

+ (instancetype)ty_colorWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B A:(CGFloat)A
{
    return [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A];
}

@end
