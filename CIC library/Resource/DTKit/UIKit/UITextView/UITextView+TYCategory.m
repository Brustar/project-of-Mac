//
//  UITextView+TYCategory.m
//  SunCity-VIP
//
//  Created by Jerry on 19/1/17.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "UITextView+TYCategory.h"

#define placeholderName @"lab_placeholder"

@implementation UITextView (TYCategory) 
-(void)ty_setPlaceHolder:(UILabel *)lab_placeholder {
    objc_setAssociatedObject(self, placeholderName, lab_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = self;
}
- (void)textViewDidChange:(UITextView *)textView {
    UILabel *lab_placeholder = objc_getAssociatedObject(textView, placeholderName);
    lab_placeholder.hidden = (textView.text.length>0);
}
@end
