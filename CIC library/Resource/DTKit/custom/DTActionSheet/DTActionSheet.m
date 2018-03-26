//
//  DTActionSheet.m
//  DTKitDemo
//
//  Created by DT on 14-12-30.
//  Copyright (c) 2014年 DT. All rights reserved.
//

#import "DTActionSheet.h"

@interface DTActionSheet()

@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,assign)CGRect screenRect;
@property(nonatomic,strong)UIView *dimBackground;
@property(nonatomic,strong)UIWindow *window;

@end

@implementation DTActionSheet

-(id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.contentViewEdgeInsets = UIEdgeInsetsZero;
        self.header = [[ActionSheetHeader alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kHeaderHeight)];
        [self addSubview:self.header];
    }
    return self;
}

- (void)setDataSource:(id<DTActionSheetDataSource>)dataSource
{
    _dataSource = dataSource;
    [self setupView];
    self.contentView = [self.dataSource contentView:self];
    CGRect frame = self.contentView.frame;
    UIEdgeInsets insets = self.contentViewEdgeInsets;
    [self addSubview:self.contentView];
    if (self.header && !self.header.hidden) {
        self.frame = CGRectMake(0, self.screenRect.size.height - frame.size.height - insets.top - insets.bottom -kHeaderHeight, self.screenRect.size.width, frame.size.height + insets.top +insets.bottom +kHeaderHeight);
        self.contentView.frame = CGRectMake(insets.left, insets.top +kHeaderHeight, frame.size.width, frame.size.height);
        
        if (self.header.cancelButton) {
            [self.header.cancelButton addTarget:self action:@selector(clickCancelButton:) forControlEvents:UIControlEventTouchUpInside];
        }if (self.header.doneButton) {
            [self.header.doneButton addTarget:self action:@selector(clickDoneButton:) forControlEvents:UIControlEventTouchUpInside];
        }
    }else{
        self.frame = CGRectMake(0, self.screenRect.size.height - frame.size.height - insets.top - insets.bottom, self.screenRect.size.width, frame.size.height + insets.top +insets.bottom);
        self.contentView.frame = CGRectMake(insets.left, insets.top, frame.size.width, frame.size.height);
    }
}

- (void)setupView
{
    self.screenRect = [UIScreen mainScreen].bounds;
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
        self.screenRect = CGRectMake(0, 0, self.screenRect.size.height, self.screenRect.size.width);
    }
    self.dimBackground = [[UIView alloc] initWithFrame:self.screenRect];
    self.dimBackground.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self.dimBackground addGestureRecognizer:gr];
}


- (void)show {
    self.window = [[UIWindow alloc] initWithFrame:self.screenRect];
    self.window.windowLevel = UIWindowLevelAlert;
    self.window.backgroundColor = [UIColor clearColor];
    self.window.rootViewController = [UIViewController new];
    self.window.rootViewController.view.backgroundColor = [UIColor clearColor];
    [self.window.rootViewController.view addSubview:self.dimBackground];
    [self.window.rootViewController.view addSubview:self];
    self.window.hidden = NO;
    
    self.dimBackground.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    self.frame = CGRectMake(0, self.screenRect.size.height+self.frame.size.height, self.frame.size.width, self.frame.size.height);
    CGFloat y = self.screenRect.size.height-self.frame.size.height;
    [UIView animateWithDuration:kDuration animations:^{
        self.frame = CGRectMake(0, y, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:kDuration animations:^{
        self.dimBackground.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(0, self.screenRect.size.height, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        self.window = nil;
    }];
}

-(void)clickCancelButton:(UIButton*)button
{
    [self dismiss];
    if (self.delegate && [self.delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [self.delegate actionSheet:self clickedButtonAtIndex:0];
    }
}

-(void)clickDoneButton:(UIButton*)button
{
    [self dismiss];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [self.delegate actionSheet:self clickedButtonAtIndex:1];
    }
}

-(void)setHeader:(ActionSheetHeader *)header
{
    if (header ==nil) {
        [_header removeFromSuperview];
        _header = nil;
    }else{
        _header = header;
    }
}

@end

@implementation ActionSheetHeader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    self.bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    self.bgView.backgroundColor = [kOtherColor(@"92A2B8") colorWithAlphaComponent:0.1];
    [self addSubview:self.bgView];
    
    self.cancelButton = [UIButton new];
    [self.cancelButton setImageOfNormal:@"AlertBack"];
    self.cancelButton.frame = CGRectMake(5, 0, 50, CGRectGetHeight(self.frame));
    [self addSubview:self.cancelButton];
    
    self.doneButton = [UIButton new];
    [self.doneButton setImageOfNormal:@"AlertOk"];
    self.doneButton.frame = CGRectMake(CGRectGetWidth(self.frame)-55, 0, 50, CGRectGetHeight(self.frame));
    [self addSubview:self.doneButton];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = kArialBoldMTFont(17);
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = kFontColor;
    CGFloat x = self.cancelButton.frame.origin.x + self.cancelButton.frame.size.width +5;
    self.titleLabel.frame = CGRectMake(x,0, CGRectGetWidth(self.frame) - x - self.doneButton.frame.size.width -5, CGRectGetHeight(self.frame));
    [self addSubview:self.titleLabel];
}

@end;
