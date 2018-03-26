//
//  UIButton+TYCategory.m
//  SunCity-VIP
//
//  Created by Jerry on 4/11/16.
//  Copyright © 2016年 MT. All rights reserved.
//

#import "UIButton+TYCategory.h"

@implementation UIButton (TYCategory)
/**  设置按钮里 图片&文字 之间的间隔  */
- (void)ty_setImageAndTextPadding:(CGFloat)padding
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, padding/2.0, 0, -padding/2.0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -padding/2.0, 0, padding/2.0);
    self.contentEdgeInsets = UIEdgeInsetsMake(0, padding, 0, padding);
}

/**  改变图片 & 文字方向(左文字右图片)  */
- (void)ty_changeDirectionWithPadding:(CGFloat)padding
{
    UIFont *font_N = self.titleLabel.font;
    NSString *text_N = [self titleForState:UIControlStateNormal];
    UIImage *image_N = [self imageForState:UIControlStateNormal];
    CGSize buttonLabelS = [text_N boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font_N} context:nil].size;
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -image_N.size.width-padding, 0, image_N.size.width+padding)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, buttonLabelS.width+padding, 0, -buttonLabelS.width-padding)];
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, padding, 0, padding)];
}

/**  上图片下文字  */
- (void)ty_verticalImageAndTitle:(CGFloat)spacing
{
    
    // 获取文字Size & 图片Size
    NSDictionary *attrs = @{NSFontAttributeName : self.titleLabel.font};
    CGSize textSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    CGSize titleSize = textSize;
    
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGSize imageSize = self.imageView.image.size;
    
    // 判断宽度
    CGFloat maxWidth = MAX(imageSize.width, titleSize.width);
    CGFloat currWidth = imageSize.width+titleSize.width;
    CGFloat diffWidth = currWidth-maxWidth;
    
    // 判断高度
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    CGFloat currHeight = MAX(imageSize.height, titleSize.height);
    CGFloat diffHeight = totalHeight-currHeight;
    
    // 获取位移
    CGFloat imageTop;
    CGFloat imageWidth;
    CGFloat labelTop;
    CGFloat labelWidth;
    // 纵向(暂时没考虑 文字高度>图片高度)
    if (imageSize.height>titleSize.height) {
        imageTop = diffHeight/2.0;
        labelTop = (-titleSize.height+imageSize.height+diffHeight)/2.0;
    }
    // 横向
    if (imageSize.width>titleSize.width) {
        imageWidth = diffWidth/2.0;
        labelWidth = (diffWidth+imageSize.width-titleSize.width)/2.0;
    } else {
        imageWidth = diffWidth/2.0+titleSize.width/2.0-imageSize.width/2.0;
        labelWidth = diffWidth/2.0;
    }
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(labelTop, -labelWidth, -labelTop, labelWidth)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(-imageTop, imageWidth, imageTop, -imageWidth)];
    [self setContentEdgeInsets:UIEdgeInsetsMake(spacing*2, -diffWidth/2.0, spacing*2, -diffWidth/2.0)];
}

/**  添加垂直间隙  */
- (void)ty_addContentVerticalPadding:(CGFloat)padding
{
    [self ty_addContentVerticalTopPadding:padding];
    [self ty_addContentVerticalBottomPadding:padding];
}
- (void)ty_addContentVerticalTopPadding:(CGFloat)padding
{
    UIEdgeInsets tempInsets = self.contentEdgeInsets;
    tempInsets.top+=padding;
    self.contentEdgeInsets = tempInsets;
}
- (void)ty_addContentVerticalBottomPadding:(CGFloat)padding
{
    UIEdgeInsets tempInsets = self.contentEdgeInsets;
    tempInsets.bottom+=padding;
    self.contentEdgeInsets = tempInsets;
}

/**  添加水平间隙  */
- (void)ty_addContentHorizontalPadding:(CGFloat)padding
{
    UIEdgeInsets tempInsets = self.contentEdgeInsets;
    tempInsets.left+=padding;
    tempInsets.right+=padding;
    self.contentEdgeInsets = tempInsets;
}



@end
