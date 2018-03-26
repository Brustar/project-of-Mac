// UIImage+Alpha.h
// Created by Trevor Harmon on 9/20/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Helper methods for adding an alpha layer to an image
#import <UIKit/UIKit.h>

@interface UIImage (Alpha)

#pragma mark - 是否有透明度
/*!
 *  @author DT, 15-09-02 17:09:59
 *
 *  @brief  是否有透明度
 *
 *  @return
 */
- (BOOL)hasAlpha;

#pragma mark - 获取有透明度的图片
/*!
 *  @author DT, 15-09-02 17:09:35
 *
 *  @brief  获取有透明度的图片
 *
 *  @return 
 */
- (UIImage *)imageWithAlpha;

#pragma mark - 裁剪图片,边框透明
/*!
 *  @author DT, 15-09-02 17:09:12
 *
 *  @brief  裁剪图片,边框透明
 *
 *  @param borderSize 边框值
 *
 *  @return
 */
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;

#pragma mark - 裁切含透明图片为最小大小
/*!
 *  @author DT, 15-09-02 17:09:57
 *
 *  @brief  裁切含透明图片为最小大小
 *
 *  @return
 */
- (UIImage *)trimmedBetterSize;

@end
