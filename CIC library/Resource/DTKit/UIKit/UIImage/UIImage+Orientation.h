//
//  UIImage+Orientation.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/4.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Orientation)

/*!
 *  @author DT, 15-09-02 20:09:31
 *
 *  @brief  修正图片方向
 *
 *  @param srcImg
 *
 *  @return
 */
+ (UIImage *)fixOrientation:(UIImage *)srcImg;

/*!
 *  @author DT, 15-09-02 20:09:42
 *
 *  @brief  图片顺时针旋转
 *
 *  @param degrees 旋转角度
 *
 *  @return
 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/*!
 *  @author DT, 15-09-02 20:09:56
 *
 *  @brief  图片逆时针旋转
 *
 *  @param radians 旋转角度
 *
 *  @return
 */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

/*!
 *  @author DT, 15-09-02 20:09:15
 *
 *  @brief  图片垂直翻转
 *
 *  @return
 */
- (UIImage *)flipVertical;

/*!
 *  @author DT, 15-09-02 20:09:27
 *
 *  @brief  水平翻转
 *
 *  @return 
 */
- (UIImage *)flipHorizontal;

/*!
 *  @author JY, 16-09-02 20:09:27
 *
 *  @brief  图片翻转
 *
 *  @return
 */
- (UIImage *)flipWithRotation:(UIImageOrientation)orientation;

@end
