//
//  UIImage+Color.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/*!
 *  @author DT, 15-09-02 19:09:17
 *
 *  @brief  获取纯颜色图片
 *
 *  @param color
 *
 *  @return
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/*!
 *  @author DT, 15-09-02 19:09:48
 *
 *  @brief  返回该图片是否有透明度通道
 *
 *  @return 
 */
- (BOOL)hasAlphaChannel;

/*!
 *  @author DT, 15-09-02 19:09:40
 *
 *  @brief  获得灰度图
 *
 *  @param sourceImage
 *
 *  @return
 */
+ (UIImage*)covertToGrayImageFromImage:(UIImage*)sourceImage;

@end
