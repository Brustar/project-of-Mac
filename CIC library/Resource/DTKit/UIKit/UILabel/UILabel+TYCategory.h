//
//  UILabel+TYCategory.h
//  SunCity-VIP
//
//  Created by Jerry on 13/2/17.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TYCategory)
/**  扩大UIbel背景 设置横向纵向的Padding  */
- (void)ty_setVertical:(CGFloat)vertical horizontal:(CGFloat)horizontal;

/**  获取图片+文本View  */
+ (UIView *)ty_imgTextViewWithImgName:(NSString *)imgName text:(NSString *)text
            initControl:(void (^)(UIImageView *imageView,UILabel *label))initControl;

@end
