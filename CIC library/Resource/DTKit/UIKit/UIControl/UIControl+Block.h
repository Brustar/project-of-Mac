//
//  UIControl+Block.h
//  FXCategories
//
//  Created by fox softer on 15/2/23.
//  Copyright (c) 2015年 foxsofter. All rights reserved.
//  https://github.com/foxsofter/FXCategories
//  http://stackoverflow.com/questions/2437875/target-action-uicontrolevents
#import <UIKit/UIKit.h>

/*!
 *  @author DT
 *
 *  @brief  UIControl的分类,主要增加控件触发
 */
@interface UIControl (Block)

#pragma mark - 增加单点触摸按下控件
/*!
 *  @author DT
 *
 *  @brief  单点触摸按下控件：用户点触屏幕，或者又有新手指落下的时候。
 *
 *  @param eventBlock 回调方法
 */
- (void)touchDown:(void (^)(void))eventBlock;

#pragma mark - 增加多点触摸按下控件
/*!
 *  @author DT
 *
 *  @brief  多点触摸按下控件，点触计数大于1：用户按下第二、三、或第四根手指的时候。
 *
 *  @param eventBlock 回调方法
 */
- (void)touchDownRepeat:(void (^)(void))eventBlock;

#pragma mark - 增加当一次触摸在控件窗口内拖动时。
/*!
 *  @author DT
 *
 *  @brief  当一次触摸在控件窗口内拖动时。
 *
 *  @param eventBlock 回调方法
 */
- (void)touchDragInside:(void (^)(void))eventBlock;

#pragma mark - 增加当一次触摸在控件窗口之外拖动时。
/*!
 *  @author DT
 *
 *  @brief  当一次触摸在控件窗口之外拖动时。
 *
 *  @param eventBlock 回调方法
 */
- (void)touchDragOutside:(void (^)(void))eventBlock;

#pragma mark - 增加当一次触摸从控件窗口之外拖动到内部时。
/*!
 *  @author DT
 *
 *  @brief  当一次触摸从控件窗口之外拖动到内部时。
 *
 *  @param eventBlock 回调方法
 */
- (void)touchDragEnter:(void (^)(void))eventBlock;

#pragma mark - 增加当一次触摸从控件窗口内部拖动到外部时。
/*!
 *  @author DT
 *
 *  @brief  当一次触摸从控件窗口内部拖动到外部时。
 *
 *  @param eventBlock 回调方法
 */
- (void)touchDragExit:(void (^)(void))eventBlock;

#pragma mark - 增加所有在控件之内触摸抬起事件。
/*!
 *  @author DT
 *
 *  @brief  所有在控件之内触摸抬起事件。
 *
 *  @param eventBlock 回调方法
 */
- (void)touchUpInside:(void (^)(void))eventBlock;

#pragma mark - 增加所有在控件之外触摸抬起事件
/*!
 *  @author DT
 *
 *  @brief  所有在控件之外触摸抬起事件(点触必须开始与控件内部才会发送通知)。
 *
 *  @param eventBlock 回调方法
 */
- (void)touchUpOutside:(void (^)(void))eventBlock;

#pragma mark - 增加所有触摸取消事件
/*!
 *  @author DT
 *
 *  @brief  所有触摸取消事件，即一次触摸因为放上了太多手指而被取消，或者被上锁或者电话呼叫打断。
 *
 *  @param eventBlock 回调方法
 */
- (void)touchCancel:(void (^)(void))eventBlock;

#pragma mark - 增加当控件的值发生改变时事件
/*!
 *  @author DT
 *
 *  @brief  当控件的值发生改变时，发送通知。用于滑块、分段控件、以及其他取值的控件。你可以配置滑块控件何时发送通知，在滑块被放下时发送，或者在被拖动时发送。
 *
 *  @param eventBlock 回调方法
 */
- (void)valueChanged:(void (^)(void))eventBlock;

#pragma mark - 增加当文本控件中开始编辑时事件。
/*!
 *  @author DT
 *
 *  @brief  当文本控件中开始编辑时发送通知。
 *
 *  @param eventBlock 回调方法
 */
- (void)editingDidBegin:(void (^)(void))eventBlock;

#pragma mark - 增加当文本控件中的文本被改变时事件。
/*!
 *  @author DT
 *
 *  @brief  当文本控件中的文本被改变时发送通知。
 *
 *  @param eventBlock 回调方法
 */
- (void)editingChanged:(void (^)(void))eventBlock;

#pragma mark - 增加当文本控件中编辑结束时事件。
/*!
 *  @author DT
 *
 *  @brief  当文本控件中编辑结束时发送通知。
 *
 *  @param eventBlock 回调方法
 */
- (void)editingDidEnd:(void (^)(void))eventBlock;

#pragma mark - 增加当文本控件内通过按下回车键（或等价行为）结束编辑时事件。
/*!
 *  @author DT
 *
 *  @brief  当文本控件内通过按下回车键（或等价行为）结束编辑时，发送通知。
 *
 *  @param eventBlock 回调方法
 */
- (void)editingDidEndOnExit:(void (^)(void))eventBlock;

@end