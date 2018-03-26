//
//  UILabel+Attributes.h
//  uikitDemo
//
//  Created by DT on 15/8/12.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @author DT
 *
 *  @brief  UILabel的分类,简便原有方法代码量
 */
@interface UILabel (Attributes)

//初始化
- (instancetype)init;

/*!
 *  @author DT
 *
 *  @brief  设置文本颜色为黑色
 */
- (void) setBlackColorOfText;

/*!
 *  @author DT
 *
 *  @brief  设置文本颜色为灰色
 */
- (void) setGrayColorOfText;

/*!
 *  @author DT
 *
 *  @brief  设置文本颜色为白色
 */
- (void) setWhiteColorOfText;

/*!
 *  @author DT
 *
 *  @brief  设置文本为左对齐
 */
- (void) setLeftAlignmentOfText;

/*!
 *  @author DT
 *
 *  @brief  设置文本为中间对齐
 */
- (void) setCenterAlignmentOfText;

/*!
 *  @author DT
 *
 *  @brief  设置文本为右对齐
 */
- (void) setRightAlignmentOfText;

@end
