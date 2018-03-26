//
//  UILabel+Attributes.m
//  uikitDemo
//
//  Created by DT on 15/8/12.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "UILabel+Attributes.h"

@implementation UILabel (Attributes)

- (instancetype)init
{
   
    self = [super init];
    if (self) {
        self.numberOfLines = 2;
        self.adjustsFontSizeToFitWidth = YES;
        [self setExclusiveTouch:YES];
    }
    return self;
}

- (void) setBlackColorOfText;
{
    [self setTextColor:[UIColor blackColor]];
}

- (void) setGrayColorOfText;
{
    [self setTextColor:[UIColor grayColor]];
}

- (void) setWhiteColorOfText;
{
    [self setTextColor:[UIColor whiteColor]];
}

- (void) setLeftAlignmentOfText;
{
    [self setTextAlignment:NSTextAlignmentLeft];
}

- (void) setCenterAlignmentOfText;
{
    [self setTextAlignment:NSTextAlignmentCenter];
}

- (void) setRightAlignmentOfText;
{
    [self setTextAlignment:NSTextAlignmentRight];
}

@end
