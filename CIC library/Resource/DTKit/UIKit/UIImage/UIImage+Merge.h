//
//  UIImage+Merge.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Merge)

/*!
 *  @author DT, 15-09-02 20:09:18
 *
 *  @brief  图片合并
 *
 *  @param firstImage
 *  @param secondImage
 *
 *  @return 
 */
+ (UIImage*)mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;

@end
