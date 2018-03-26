//
//  DTToastView.m
//  kingsun
//
//  Created by DT on 2018/1/1.
//Copyright © 2018年 DT. All rights reserved.
//

#import "DTToastView.h"

@interface DTToastView ()

@property (nonatomic, assign)   BOOL isWarned;

@end

@implementation DTToastView

#pragma mark - life cycle

+(void)showWithText:(NSString *)text superView:(UIView*)superView isWarned:(BOOL)isWarned {
    DTToastView *view = [[DTToastView alloc] init];
    view.text = text;
    view.isWarned = isWarned;
    [superView addSubview:view];
    [view setupUI];
}

- (instancetype)init {
    self = [super init];
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
-(void)setupUI {
    self.font = [UIFont systemFontOfSize:16.0];
    [self setBoundOfRadius:20.0];
    self.text = [NSString stringWithFormat:@"      %@      ",self.text];
    if (self.isWarned) {//是警告
        self.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor colorWithHexString:@"fd2a39"];
    }else {//提示
        self.textColor = [UIColor colorWithHexString:@"9b590c"];
        self.backgroundColor = [UIColor colorWithHexString:@"fdd866"];
    }
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.superview);
        make.height.equalTo(@44);
    }];
    
    self.alpha = 0.0f;
    
    
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:3];
}

-(void)showAnimation{
    [UIView beginAnimations:@"show" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    self.alpha = 1.0f;
    [UIView commitAnimations];
}

-(void)hideAnimation{
    [UIView beginAnimations:@"hide" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissToast)];
    [UIView setAnimationDuration:0.3];
    self.alpha = 0.0f;
    [UIView commitAnimations];
}

-(void)dismissToast{
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
}

#pragma mark - setter

#pragma mark - getter

@end
