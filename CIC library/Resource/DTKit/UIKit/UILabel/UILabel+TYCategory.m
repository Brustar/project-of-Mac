//
//  UILabel+TYCategory.m
//  SunCity-VIP
//
//  Created by Jerry on 13/2/17.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "UILabel+TYCategory.h"

@implementation UILabel (TYCategory)
/**  扩大UIbel背景 设置横向纵向的Padding  */
- (void)ty_setVertical:(CGFloat)vertical horizontal:(CGFloat)horizontal {
    NSString *labText = self.text;
    
    CGSize size = [labText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font} context:nil].size;
    size.height += vertical*2;
    size.width += horizontal*2;
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(size.width);
        make.height.mas_equalTo(size.height);
    }];
}

+ (UIView *)ty_imgTextViewWithImgName:(NSString *)imgName text:(NSString *)text
            initControl:(void (^)(UIImageView *imageView,UILabel *label))initControl
{
    
    CGFloat imageTextPadding = 15.0;
    if (DevicePad) {
        imageTextPadding = 15;
    }
    CGFloat fontSize = 14.0;
    CGFloat imageHeightAndWidth = fontSize+2;
    
    // 1. 菜类型
    UIView *view_textImg = [[UIView alloc] init]; {
        UIFont *textFont = [UIFont systemFontOfSize:14.0];
        
        // 1. 图片
        UIImageView *imgV_icon = [[UIImageView alloc] init]; {
            imgV_icon.image = [UIImage imageNamed:imgName];
            imgV_icon.contentMode = UIViewContentModeScaleAspectFit;
            
            [view_textImg addSubview:imgV_icon];
            [imgV_icon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(view_textImg);
                make.left.equalTo(view_textImg);
                make.width.mas_equalTo(imageHeightAndWidth);
            }];
        }
        
        // 2. 文字
        UILabel *lab_title = [[UILabel alloc] init]; {
            lab_title.text = text;
            lab_title.font = textFont;
            lab_title.textColor = [UIColor colorWithHexString:@"#cccccc"];
            lab_title.numberOfLines = 0;
            lab_title.adjustsFontSizeToFitWidth = YES;
            
            [view_textImg addSubview:lab_title];
            [lab_title mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(view_textImg);
                make.left.equalTo(imgV_icon.mas_right).offset(imageTextPadding);
                make.right.equalTo(view_textImg);
            }];
        }
        
        if (initControl) {
            initControl(imgV_icon, lab_title);
        }
        
//        view_textImg.backgroundColor = [UIColor redColor];
//        imgV_icon.backgroundColor = [UIColor blueColor];
//        lab_title.backgroundColor = [UIColor greenColor];
        
        [view_textImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(lab_title);
        }];
    }
    
    return view_textImg;
}

@end
