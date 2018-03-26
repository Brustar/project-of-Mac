//
//  UIImage+FileName.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FileName)

/*!
 *  @author DT, 15-09-02 20:09:41
 *
 *  @brief  根据图片名返回UIImage
 *
 *  @param name 图片名称
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithFileName:(NSString *)name;

/*!
 *  @author Raymond, 2017.3.20
 *
 *  @brief  根据图片路径名返回UIImage(会寻找2x和3x)
 *
 *  @param name 图片名称
 *  @param extension 图片扩展名（不带 "."）
 *
 *  @return UIImage
 */
+(UIImage *)imageWithBundleResouceImageName:(NSString *)imageName withExtension:(NSString *)extension;

/*!
 *  @author Raymond, 2017.3.20
 *
 *  @brief  根据图片路径名返回UIImage(会寻找2x和3x),并且自动寻找ipad和iphone需要使用的图
 *
 *  @param name 图片名称
 *  @param extension 图片扩展名（不带 "."）
 *
 *  @return UIImage
 */
+(UIImage *)imageAdapteWithBundleResouceImageName:(NSString *)imageName withExtension:(NSString *)extension;


/*!
 *  @author Raymond, 2017.3.20
 *
 *  @brief  返回默认背景图(会寻找2x和3x),并且自动寻找ipad和iphone需要使用的图
 *
 *  @return UIImage
 */
+(UIImage *)imageWithSunCityBackGround;

@end
