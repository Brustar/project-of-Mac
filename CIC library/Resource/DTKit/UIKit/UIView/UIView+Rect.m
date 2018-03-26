//
//  UIView+Rect.m
//  uikitDemo
//
//  Created by DT on 15/8/12.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "UIView+Rect.h"

@implementation UIView (Rect)

#pragma mark - setter
-(void) setSize:(CGSize)size
{
    self.frame = (CGRect){self.origin, size};
}

- (void)setOrigin:(CGPoint)origin
{
    self.frame = (CGRect){origin, self.size};
}

-(void) setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

-(void) setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

-(void) setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(void) setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(void) setOffsetX:(CGFloat)offsetX
{
    CGRect frame = self.frame;
    frame.origin.x += offsetX;
    self.frame = frame;
}

-(void) setOffsetY:(CGFloat)offsetY
{
    CGRect frame = self.frame;
    frame.origin.y += offsetY;
    self.frame = frame;
}

-(void) setOffsetWidth:(CGFloat)offsetWidth
{
    CGRect frame = self.frame;
    frame.size.width += offsetWidth;
    self.frame = frame;
}

-(void) setOffsetHeight:(CGFloat)offsetHeight
{
    CGRect frame = self.frame;
    frame.size.height += offsetHeight;
    self.frame = frame;
}

#pragma mark - getter
-(CGSize) size
{
    return self.frame.size;
}

-(CGPoint) origin
{
    return self.frame.origin;
}

-(CGFloat) left
{
    return self.frame.origin.x;
}

-(CGFloat) top
{
    return self.frame.origin.y;
}

-(CGFloat) width
{
    return self.frame.size.width;
}

-(CGFloat) height
{
    return self.frame.size.height;
}

-(CGFloat) right
{
    return self.left + self.width;
}

-(CGFloat) bottom
{
    return self.top + self.height;
}

-(CGFloat) offsetX
{
    return 0.f;
}

-(CGFloat) offsetY
{
    return 0.f;
}

-(CGFloat) offsetWidth
{
    return 0.f;
}

-(CGFloat) offsetHeight
{
    return 0.f;
}

@end
