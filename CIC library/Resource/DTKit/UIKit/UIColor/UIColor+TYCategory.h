//
//  UIColor+TYCategory.h
//  ERP
//
//  Created by Jerry on 3/7/17.
//  Copyright © 2017年 soonest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TYCategory)

+ (instancetype)ty_colorWithW:(CGFloat)W;

+ (instancetype)ty_colorWithW:(CGFloat)W A:(CGFloat)A;

+ (instancetype)ty_colorWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B;

+ (instancetype)ty_colorWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B A:(CGFloat)A;

@end
