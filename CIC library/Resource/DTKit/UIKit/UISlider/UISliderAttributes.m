//
//  UISliderAttributes.m
//  ProjectManager
//
//  Created by soonest on 2018/3/8.
//Copyright © 2018年 soonest. All rights reserved.
//

#import "UISliderAttributes.h"

@interface UISliderAttributes ()

@end

@implementation UISliderAttributes

#pragma mark - life cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)dealloc {
    
}

#pragma mark - delegate

#pragma mark - event response

#pragma mark - public methods

#pragma mark - private methods

- (CGRect)trackRectForBounds:(CGRect)bounds
{
    bounds = [super trackRectForBounds:bounds];
    return CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, 10);
}

#pragma mark - setter

#pragma mark - getter

@end
