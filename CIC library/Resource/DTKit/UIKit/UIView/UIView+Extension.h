//
//  UIView+Extension.h
//  uikitDemo
//
//  Created by DT on 15/8/29.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

#pragma mark - UIView截图
/*!
 *  @author DT, 15-08-29 17:08:10
 *
 *  @brief  把指定view转化成半透明高清图片
 *
 *  @return UIImage
 */
- (UIImage *)translucenceHQPicture;

#pragma mark view转化模糊image
/*!
 *  @Author DT
 *
 *  @brief  把指定view转化成模糊图片
 *
 *  @return 模糊图片
 */
- (UIImage*)fuzzyPicture;

#pragma mark view转化高清image(可用于屏幕截图)
/*!
 *  @Author DT
 *
 *  @brief  把指定view转化成高清图片
 *
 *  @param view 指定view
 *
 *  @return 高清图片
 */
- (UIImage*)HQPicture;

#pragma mark - 获取UIView所对应的UIViewController
/*!
 *  @author DT, 15-08-29 17:08:27
 *
 *  @brief  获取UIView所对应的UIViewController
 */
@property (readonly) UIViewController *viewController;

@end
