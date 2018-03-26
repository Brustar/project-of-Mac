//
//  UITextView+TYCategory.h
//  SunCity-VIP
//
//  Created by Jerry on 19/1/17.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (TYCategory) <UITextViewDelegate>
/**  设置placeHolder  */
-(void)ty_setPlaceHolder:(UILabel *)lab_placeholder;
@end
