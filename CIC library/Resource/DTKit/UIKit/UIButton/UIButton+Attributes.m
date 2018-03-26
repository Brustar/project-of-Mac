//
//  UIButton+Attributes.m
//  uikitDemo
//
//  Created by DT on 15/8/12.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "UIButton+Attributes.h"
#import <objc/runtime.h>

static const void *UIButtonBlockKey = &UIButtonBlockKey;

@implementation UIButton (Attributes)

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setExclusiveTouch:YES];
    }
    return self;
}

- (void) setActionTouchUpInside:(AttButtonTouchedBlock)touchUpInside
{
    objc_setAssociatedObject(self, UIButtonBlockKey, touchUpInside, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) actionTouched:(UIButton *)btn
{
    AttButtonTouchedBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    
    if (block) {
        block();
    }
}

- (void) setFontOfSize:(CGFloat)size
{
    self.titleLabel.font = [UIFont systemFontOfSize:size];
}

- (void) setTitleOfNormal:(NSString*)title
{
    [self setTitle:title forState:UIControlStateNormal];
}

- (void) setTitleOfHighlighted:(NSString *)title
{
    [self setTitle:title forState:UIControlStateHighlighted];
}

- (void) setColorOfNormal:(UIColor*)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
}

- (void) setColorOfHighlighted:(UIColor*)color
{
    [self setTitleColor:color forState:UIControlStateHighlighted];
}

- (void) setBlackColorOfNormal;
{
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void) setBlackColorOfHighlighted
{
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
}

- (void) setGrayColorOfNormal
{
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

- (void) setGrayColorOfHighlighted
{
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
}

- (void) setWhiteColorOfNormal
{
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void) setWhitColorOfHighlighted
{
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
}

- (void) setImageOfNormal:(NSString*)imageName
{
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void) setImageOfHighlighted:(NSString *)imageName
{
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
}

- (void) setImageOfSelected:(NSString *)imageName
{
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
}

- (void) setBackgroundImageOfNormal:(NSString*)imageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void) setBackgroundImageOfHighlighted:(NSString *)imageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
}

- (void) setBackgroundColorOfNormal:(UIColor*)color
{
    [self setBackgroundImage:[UIButton imageWithColor:color] forState:UIControlStateNormal];
}

- (void) setBackgroundColorOfHighlighted:(UIColor*)color
{
    [self setBackgroundImage:[UIButton imageWithColor:color] forState:UIControlStateHighlighted];
}

#pragma mark - private method
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
