//
//  UIImage+LaunchImage.h
//  uikitDemo
//
//  Created by DT on 15/8/27.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @author DT
 *
 *  @brief  获取启动图
 */
@interface UIImage (LaunchImage)

#pragma mark - 获取 iPhone4/4s 启动图
+(UIImage*)LaunchImage_700;

#pragma mark - 获取 iPhone5/5s/5c 启动图
+(UIImage*)LaunchImage_700_568h;

#pragma mark - 获取 iPhone6 启动图
+(UIImage*)LaunchImage_800_667h;

#pragma mark - 获取 iPhone6 plus 竖屏 启动图
+(UIImage*)LaunchImage_800_Portrait_736h;

#pragma mark - 获取 iPhone6 plus 横屏 启动图
+(UIImage*)LaunchImage_800_Landscape_736h;

@end
