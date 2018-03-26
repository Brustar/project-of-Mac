#import <UIKit/UIKit.h>

/*!
 *  @author DT, 15-09-02 17:09:31
 *
 *  @brief  一个gif的分类
 */
@interface UIImage (animatedGIF)

#pragma mark - 根据gif的名称获取UIImage
/*!
 *  @author DT, 15-09-02 17:09:59
 *
 *  @brief  根据gif的名称获取UIImage
 *
 *  @param name gif的名称
 *
 *  @return UIImage
 */
+ (UIImage *)animatedImageWithAnimatedGIFName:(NSString *)name;

#pragma mark - 把gif的NSData转化成UIImage
/*!
 *  @author DT, 15-09-02 17:09:59
 *
 *  @brief  把gif的NSData转化成UIImage
 *
 *  @param theURL gif的地址
 *
 *  @return UIImage
 */
+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)theData;

#pragma mark - 把gif的NSURL转化成UIImage
/*!
 *  @author DT, 15-09-02 17:09:59
 *
 *  @brief  把gif的NSURL转化成UIImage
 *
 *  @param theURL gif的地址
 *
 *  @return UIImage
 */
+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)theURL;

@end
