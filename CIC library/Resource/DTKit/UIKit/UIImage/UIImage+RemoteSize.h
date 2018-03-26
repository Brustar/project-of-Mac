//
//  UIImage+RemoteSize.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/27.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIImageSizeRequestCompleted) (NSURL* imgURL, CGSize size);

@interface UIImage (RemoteSize)

/*!
 *  @author DT, 15-09-02 20:09:51
 *
 *  @brief  根据图片地址获取高宽
 *
 *  @param imgURL     图片地址
 *  @param completion 回调函数
 */
+ (void)requestSizeNoHeader:(NSURL*)imgURL completion:(UIImageSizeRequestCompleted)completion;

@end