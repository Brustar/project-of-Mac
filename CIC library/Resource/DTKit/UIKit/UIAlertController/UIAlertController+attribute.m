//
//  UIAlertController+attribute.m
//  CIC library
//
//  Created by Brustar.xiao on 2018/3/21.
//  Copyright © 2018年 Brustar.xiao. All rights reserved.
//

#import "UIAlertController+attribute.h"

@implementation UIAlertController (attribute)

-(UILabel *)titleLable
{
    UIView *subView1 = self.view.subviews[0];
    UIView *subView2 = subView1.subviews[0];
    UIView *subView3 = subView2.subviews[0];
    UIView *subView4 = subView3.subviews[0];
    UIView *subView5 = subView4.subviews[0];
    
    return subView5.subviews[0];
}

-(UILabel *)subTitleLable
{
    UIView *subView1 = self.view.subviews[0];
    UIView *subView2 = subView1.subviews[0];
    UIView *subView3 = subView2.subviews[0];
    UIView *subView4 = subView3.subviews[0];
    UIView *subView5 = subView4.subviews[0];
    
    return subView5.subviews[1];
}

@end
