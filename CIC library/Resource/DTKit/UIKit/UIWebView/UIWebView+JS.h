//
//  UIWebView+JS.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/22.
//  Copyright (c) 2014年 duzixi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (JS)

#pragma mark - 获取网页中的数据

#pragma mark - 获取某个标签的结点个数
/// 获取某个标签的结点个数
- (int)nodeCountOfTag:(NSString *)tag;

#pragma mark - 获取当前页面URL
/// 获取当前页面URL
- (NSString *) getCurrentURL;

#pragma mark - 获取标题
/// 获取标题
- (NSString *) getTitle;

#pragma mark - 获取图片
/// 获取图片
- (NSArray *) getImgs;

#pragma mark - 获取当前页面所有链接
/// 获取当前页面所有链接
- (NSArray *) getOnClicks;

#pragma mark - 改变网页样式和行为

#pragma mark - 改变背景颜色
/// 改变背景颜色
- (void) setBackgroundColor:(UIColor *)color;

#pragma mark - 为所有图片添加点击事件
/// 为所有图片添加点击事件(网页中有些图片添加无效)
- (void) addClickEventOnImg;

#pragma mark - 改变所有图像的宽度
/// 改变所有图像的宽度
- (void) setImgWidth:(int)size;

#pragma mark - 改变所有图像的高度
/// 改变所有图像的高度
- (void) setImgHeight:(int)size;

#pragma mark - 改变指定标签的字体颜色
/// 改变指定标签的字体颜色
- (void) setFontColor:(UIColor *) color withTag:(NSString *)tagName;

#pragma mark - 改变指定标签的字体大小
/// 改变指定标签的字体大小
- (void) setFontSize:(int) size withTag:(NSString *)tagName;

#pragma mark - 清除cookies
- (void)clearCookies;

@end
