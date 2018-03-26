// UIImage+RoundedCorner.h
// Created by Trevor Harmon on 9/20/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Extends the UIImage class to support making rounded corners
#import <UIKit/UIKit.h>
@interface UIImage (RoundedCorner)

/*!
 *  @author DT, 15-09-03 00:09:43
 *
 *  @brief  圆形图片
 *
 *  @param cornerSize 角度
 *  @param borderSize 边界
 *
 *  @return 
 */
- (UIImage *)roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;

@end
