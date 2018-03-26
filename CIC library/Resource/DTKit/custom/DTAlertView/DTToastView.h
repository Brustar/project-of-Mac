//
//  DTToastView.h
//  kingsun
//
//  Created by DT on 2018/1/1.
//  Copyright © 2018年 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTToastView : UILabel


/**
 APP提示语

 @param text 提示内容
 @param superView 显示父类
 @param isWarned 是否警告
 */
+(void)showWithText:(NSString *)text superView:(UIView*)superView isWarned:(BOOL)isWarned;

@end
