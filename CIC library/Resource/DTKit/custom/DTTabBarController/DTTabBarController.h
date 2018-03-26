//
//  DTTabBarController.h
//  UITabBarControllerDemo
//
//  Created by DT on 15/9/4.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTTabBarItem : NSObject

/** 界面显示对象 */
@property(nonatomic,strong) UIViewController * viewController;

/** 标题 */
@property(nonatomic,copy) NSString *title;

/** 默认图片 */
@property(nonatomic,copy) NSString * normalImage;

/** 高亮图片 */
@property(nonatomic,copy) NSString * highlightImage;

/** 角标 */
@property(nonatomic,copy) NSString * badgeValue;

/*!
 *  @author DT, 15-09-06 23:09:32
 *
 *  @brief  初始化方法
 *
 *  @param viewController 界面显示controller
 *  @param title          标题
 *  @param normalImage    默认图片
 *  @param highlightImage 选中图片
 *  @param badgeValue     角标
 *
 *  @return DTTabBarItem
 */
+(DTTabBarItem*)itemWithViewController:(UIViewController*)viewController
                                 title:(NSString*)title
                           normalImage:(NSString*)normalImage
                        highlightImage:(NSString*)highlightImage
                            badgeValue:(NSString*)badgeValue;

@end

#pragma mark -

@interface DTTabBarController : UITabBarController

#pragma mark - 当前阴影效果图片
/**
 *  当前阴影效果图片
 */
@property(nonatomic,strong) UIImageView *shadeImageView;

#pragma mark - 选中item的回调函数
/*!
 *  @author DT, 15-09-06 23:09:44
 *
 *  @brief  选中item的回调函数
 */
@property(nonatomic,copy) void(^didSelectIndexBlock)(NSInteger index);

#pragma mark - 删除阴影线
/*!
 *  @author DT, 15-09-06 23:09:56
 *
 *  @brief  删除阴影线
 */
- (void) clearShadowImage;

#pragma mark - 设置默认颜色
/*!
 *  @author DT, 15-09-06 23:09:15
 *
 *  @brief  设置默认颜色
 *
 *  @param color
 */
- (void) setNormalTintColor:(UIColor*)color;

#pragma mark - 设置高亮颜色
/*!
 *  @author DT, 15-09-06 23:09:27
 *
 *  @brief  设置高亮颜色
 *
 *  @param color
 */
- (void) setHighlightedTintColor:(UIColor*)color;

#pragma mark - 设置背景色
/*!
 *  @author DT, 15-09-06 23:09:37
 *
 *  @brief  设置背景色
 *
 *  @param color
 */
- (void) setBackgroundColor:(UIColor*)color;

#pragma mark - 设置背景图片
/*!
 *  @author DT, 15-09-06 23:09:45
 *
 *  @brief  设置背景图片
 *
 *  @param image 
 */
- (void) setBackgroundImage:(UIImage*)image;

#pragma mark - 替换tabBarItem图标
/*!
 *  @author DT, 15-09-07 00:09:16
 *
 *  @brief  替换tabBarItem图标
 *
 *  @param index          第几个选项
 *  @param normalImage    默认图片
 *  @param highlightImage 高亮图片
 */
- (void) replaceAtIndex:(NSInteger)index
            normalImage:(NSString*)normalImage
         highlightImage:(NSString*)highlightImage;

@end
