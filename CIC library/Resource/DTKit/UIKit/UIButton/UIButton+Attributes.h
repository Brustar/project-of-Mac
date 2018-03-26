//
//  UIButton+Attributes.h
//  uikitDemo
//
//  Created by DT on 15/8/12.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AttButtonTouchedBlock)();
/*!
 *  @author DT
 *
 *  @brief  UIButton的分类,简便原有方法代码量
 */
@interface UIButton (Attributes)

//初始化
- (instancetype)init;


/*!
 *  @author DT
 *
 *  @brief  UIControlEventTouchUpInside事件的回调函数
 *
 *  @param touchUpInside 回调函数
 */
- (void) setActionTouchUpInside:(AttButtonTouchedBlock)touchUpInside;

/*!
 *  @author DT
 *
 *  @brief  设置字体大小
 *
 *  @param size 大小
 */
- (void) setFontOfSize:(CGFloat)size;

/*!
 *  @author DT
 *
 *  @brief  设置常规状态下文本内容
 *
 *  @param title 文本
 */
- (void) setTitleOfNormal:(NSString*)title;

/*!
 *  @author DT
 *
 *  @brief  设置高亮状态下文本内容
 *
 *  @param title 文本
 */
- (void) setTitleOfHighlighted:(NSString *)title;

/*!
 *  @author DT
 *
 *  @brief  设置常规状态下文本颜色
 *
 *  @param color 颜色
 */
- (void) setColorOfNormal:(UIColor*)color;

/*!
 *  @author DT
 *
 *  @brief  设置高亮状态下文本颜色
 *
 *  @param color 颜色
 */
- (void) setColorOfHighlighted:(UIColor*)color;

/*!
 *  @author DT
 *
 *  @brief  设置常规状态下文本颜色为黑色
 */
- (void) setBlackColorOfNormal;

/*!
 *  @author DT
 *
 *  @brief  设置高亮状态下文本颜色为黑色
 */
- (void) setBlackColorOfHighlighted;

/*!
 *  @author DT
 *
 *  @brief  设置常规状态下文本颜色为灰色
 */
- (void) setGrayColorOfNormal;

/*!
 *  @author DT
 *
 *  @brief  设置高亮状态下文本颜色为灰色
 */
- (void) setGrayColorOfHighlighted;

/*!
 *  @author DT
 *
 *  @brief  设置常规状态下文本颜色为白色
 */
- (void) setWhiteColorOfNormal;

/*!
 *  @author DT
 *
 *  @brief  设置高亮状态下文本颜色为灰色
 */
- (void) setWhitColorOfHighlighted;

/*!
 *  @author DT
 *
 *  @brief  设置常规状态下图片内容
 *
 *  @param imageName 图片
 */
- (void) setImageOfNormal:(NSString*)imageName;

/*!
 *  @author DT
 *
 *  @brief  设置高亮状态下图片内容
 *
 *  @param imageName 图片
 */
- (void) setImageOfHighlighted:(NSString*)imageName;

/*!
 *  @author DT
 *
 *  @brief  设置选择状态下图片内容
 *
 *  @param imageName 图片
 */
- (void) setImageOfSelected:(NSString *)imageName;

/*!
 *  @author MT
 *
 *  @brief  设置常规状态下图片内容
 *
 *  @param imageName 图片
 */
- (void) setBackgroundImageOfNormal:(NSString*)imageName;

/*!
 *  @author MT
 *
 *  @brief  设置高亮状态下图片内容
 *
 *  @param imageName 图片
 */
- (void) setBackgroundImageOfHighlighted:(NSString*)imageName;

/*!
 *  @author DT
 *
 *  @brief  设置常规状态下背景颜色
 *
 *  @param color 颜色
 */
- (void) setBackgroundColorOfNormal:(UIColor*)color;

/*!
 *  @author DT
 *
 *  @brief  设置高亮状态下背景颜色
 *
 *  @param color 颜色
 */
- (void) setBackgroundColorOfHighlighted:(UIColor*)color;

@end
