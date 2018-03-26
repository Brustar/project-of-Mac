//
//  UIImage+Capture.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/10.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Capture)

/*!
 *  @author DT, 15-09-02 19:09:07
 *
 *  @brief  把UIView转化成UIImage
 *
 *  @param view
 *
 *  @return 
 */
+ (UIImage *)captureWithView:(UIView *)view;

///截图（未测试是否可行）
+ (UIImage *)getImageWithSize:(CGRect)myImageRect FromImage:(UIImage *)bigImage;

@end
