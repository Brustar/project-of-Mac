//
//  UIButton+Gradiant.m
//  ProjectManager
//
//  Created by Brustar.xiao on 2018/2/24.
//  Copyright © 2018年 soonest. All rights reserved.
//

#import "UIButton+Gradient.h"

@implementation UIButton (Gradient)

-(void)setGradient:(UIColor *)startColor end:(UIColor *)endColor
{
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, 234, 50);
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.locations = @[@(0.1),@(1.0)];
    gradientLayer.cornerRadius = 24.0f;
    [gradientLayer setColors:@[(id)startColor.CGColor,(id)endColor.CGColor]];
    [self.layer addSublayer:gradientLayer];
}

@end
