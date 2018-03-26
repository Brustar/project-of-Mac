//
//  UIButton+countDown.h
//  NetworkEgOc
//
//  Created by iosdev on 15/3/17.
//  Copyright (c) 2015年 iosdev. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @author DT
 *
 *  @brief  倒计时的UIbutton分类
 */
@interface UIButton (CountDown)

#pragma mark - UIButton实现倒计时
/*!
 *  @author DT
 *
 *  @brief  倒计时方法
 *
 *  @param timeout    倒计时时间
 *  @param tittle     默认显示文字
 *  @param waitTittle 倒计时等待文本
 */
- (void) startTime:(NSInteger )timeout
             title:(NSString *)tittle
        waitTittle:(NSString *)waitTittle;
@end
