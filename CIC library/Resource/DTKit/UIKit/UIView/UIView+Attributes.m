//
//  UIView+Attributes.m
//  uikitDemo
//
//  Created by DT on 15/8/15.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "UIView+Attributes.h"

@implementation UIView (Attributes)

- (void) setBound;
{
    [self setBoundOfRadius:CGRectGetWidth(self.frame)/2 width:0 color:[UIColor clearColor]];
}

- (void) setBoundOfRadius:(CGFloat)radius;
{
    [self setBoundOfRadius:radius width:0 color:[UIColor clearColor]];
}

- (void) setBoundOfRadius:(CGFloat)radius width:(CGFloat)width;
{
    [self setBoundOfRadius:radius width:width color:[UIColor clearColor]];
}

- (void) setBoundOfRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor*)color;
{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
    [self.layer setBorderWidth:width];
    [self.layer setBorderColor:color.CGColor];
}

-(void) setRectAllCorner:(CGFloat)radius
{
    [self setRectCorner:radius roundingCorners:UIRectCornerAllCorners];
}

-(void) setRectCorner:(CGFloat)radius roundingCorners:(UIRectCorner)corners
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
}

/*
 周边加阴影，并且同时圆角
 */
- (void)addShadowToViewWithOpacity:(float)shadowOpacity
           shadowRadius:(CGFloat)shadowRadius
        andCornerRadius:(CGFloat)cornerRadius
{
    CALayer *layer = self.layer;
    [layer setCornerRadius:cornerRadius];
    //changed to zero for the new fancy shadow
    layer.shadowOffset = CGSizeZero;
    
    layer.shadowColor = [[UIColor grayColor] CGColor];
    
    //changed for the fancy shadow
    layer.shadowRadius = shadowRadius;
    
    layer.shadowOpacity = shadowOpacity;
    
    //call our new fancy shadow method
    layer.shadowPath = [self fancyShadowForRect:layer.bounds];
}

- (CGPathRef)fancyShadowForRect:(CGRect)rect
{
    CGSize size = rect.size;
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    //right
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(size.width, 0.0f)];
    [path addLineToPoint:CGPointMake(size.width, size.height + 5.0f)];
    
    //curved bottom
    [path addCurveToPoint:CGPointMake(0.0, size.height + 5.0f)
            controlPoint1:CGPointMake(size.width - 5.0f, size.height)
            controlPoint2:CGPointMake(5.0f, size.height)];
    
    [path closePath];
    
    return path.CGPath;
}

-(void) setDashBorder
{
    //self.layer.cornerRadius = CGRectGetWidth(view.bounds)/2;
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    borderLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    //    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
    borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:2].CGPath;
    borderLayer.lineWidth = 4;
    //虚线边框
    borderLayer.lineDashPattern = @[@3, @3];
    //实线边框
    //    borderLayer.lineDashPattern = nil;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = [UIColor colorWithHexString:@"CCD7E5"].CGColor;
    [self.layer addSublayer:borderLayer];
}

@end
