//
//  DTHandyCodeTool.h
//
//  Created by DT on 15/8/7.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*!
 *  @author DT
 *
 *  @brief  简便代码写法
 */

#pragma mark - UIColor

#pragma mark 根据rgb获取颜色
/*!
 *  @author DT
 *
 *  @brief  根据rgb获取颜色
 *
 *  @param r 红色值
 *  @param g 绿色值
 *  @param b 蓝色值
 *
 *  @return UIColor
 */
UIColor* color_rgb(NSInteger r, NSInteger g, NSInteger b);

#pragma mark 根据rgb和透明度获取颜色
/*!
 *  @author DT
 *
 *  @brief  根据rgb获取颜色
 *
 *  @param r 红色值
 *  @param g 绿色值
 *  @param b 蓝色值
 *  @param a 透明值
 *
 *  @return UIColor
 */
UIColor* color_rgba(NSInteger r, NSInteger g, NSInteger b, CGFloat a);

#pragma mark 获取黑色
/*!
 *  @author DT
 *
 *  @brief  获取黑色
 *
 *  @return UIColor
 */
UIColor* color_black();

#pragma mark 获取黑色(可以设置透明度)
/*!
 *  @author DT
 *
 *  @brief  获取黑色,可以设置透明度
 *
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
UIColor* color_black_alpha(CGFloat alpha);

#pragma mark 获取灰色
/*!
 *  @author DT
 *
 *  @brief  获取灰色
 *
 *  @return UIColor
 */
UIColor* color_gray();

#pragma mark 获取灰色(可以设置透明度)
/*!
 *  @author DT
 *
 *  @brief  获取灰色(可以设置透明度)
 *
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
UIColor* color_gray_alpha(CGFloat alpha);

#pragma mark 获取白色
/*!
 *  @author DT
 *
 *  @brief  获取白色
 *
 *  @return UIColor
 */
UIColor* color_white();

#pragma mark 获取白色(可以设置透明度)
/*!
 *  @author DT
 *
 *  @brief  获取白色(可以设置透明度)
 *
 *  @param alpha 透明度
 *
 *  @return UIColor
 */
UIColor* color_white_alpha(CGFloat alpha);

#pragma mark 获取无色
/*!
 *  @author DT
 *
 *  @brief  获取无色
 *
 *  @return UIColor
 */
UIColor* color_clear();

#pragma mark 获取16进制颜色
/*!
 *  @author DT
 *
 *  @brief  获取16进制颜色
 *
 *  @param hex 16进制颜色字符串
 *
 *  @return UIColor
 */
UIColor* color_hex(NSString* hex);

#pragma mark - UIFont

#pragma mark 获取常规字体
/*!
 *  @author DT
 *
 *  @brief  获取字体
 *
 *  @param size 字号
 *
 *  @return UIFont
 */
UIFont* font_sys(CGFloat size);

#pragma mark - UIImage

#pragma mark 获取图片
/*!
 *  @author DT
 *
 *  @brief  获取图片
 *
 *  @param name 图片名称
 *
 *  @return UIImage
 */
UIImage* image_name(NSString* name);

#pragma mark 获取纯色图片
/*!
 *  @author DT
 *
 *  @brief  获取纯色图片
 *
 *  @param color 颜色值
 *
 *  @return UIImage
 */
UIImage* image_color(UIColor* color);

#pragma mark - NSString

#pragma mark - int转化为string
NSString *string_i(int x);

#pragma mark - long转化为string
NSString *string_l(long x);

#pragma mark - float转化为string
NSString *string_f(float x);

#pragma mark 拼接字符串
/*!
 *  @author DT
 *
 *  @brief  拼接字符串
 *
 *  @param string,... 字符串值,不固定值,必须nil结尾
 *
 *  @return NSString
 */
NSString* string_format(NSString* string, ...);

#pragma mark 比较字符串是否相等
/*!
 *  @author DT
 *
 *  @brief  比较字符串是否相等
 *
 *  @param string1 字符串1
 *  @param string2 字符串2
 *
 *  @return 相等的话YES,不相等的话NO
 */
BOOL string_equal(NSString* string1, NSString* string2);

#pragma mark - NSNotificationCenter

#pragma mark - 发送通知
/*!
 *  @author DT, 15-09-03 23:09:41
 *
 *  @brief  发送通知
 *
 *  @param name   通知名称
 *  @param object 通知参数
 */
void notification_post(NSString* name, id object);

#pragma mark - 监听通知
/*!
 *  @author DT, 15-09-03 23:09:23
 *
 *  @brief  监听通知
 *
 *  @param observer 监听对象
 *  @param selector 监听事件
 *  @param name     通知名称
 *  @param object   通知参数
 */
void notification_add(id observer, SEL selector, NSString* name, id object);

#pragma mark - 删除通知
/*!
 *  @author DT, 15-09-03 23:09:11
 *
 *  @brief  删除通知
 *
 *  @param observer 监听对象
 *  @param name     通知名称
 *  @param object   通知参数
 */
void notification_remove(id observer, NSString* name, id object);

#pragma mark - NSIndexPath

#pragma mark 创建NSIndexPath对象
/*!
 *  @author DT
 *
 *  @brief  创建NSIndexPath对象
 *
 *  @param row
 *  @param section
 *
 *  @return NSIndexPath
 */
NSIndexPath* indexPath_row_section(NSInteger row, NSInteger section);

#pragma mark - NSArray

#pragma mark 创建NSArray对象
NSArray* Array();

#pragma mark - NSMutableArray

#pragma mark 创建NSMutableArray对象
NSMutableArray* MutableArray();

#pragma mark - NSDictionary

#pragma mark 创建NSDictionary对象
NSDictionary* Dictionary();

#pragma mark - NSMutableArray

#pragma mark 创建NSMutableDictionary对象

NSMutableDictionary* MutableDictionary();

#pragma mark - system

#pragma mark 返回设备屏幕宽度
CGFloat sys_screen_width();

#pragma mark 返回设备屏幕高度
CGFloat sys_screen_height();

#pragma mark 返回设备总的容量大小
/**
 *  @Author DT
 *
 *  @brief  返回设备总的容量大小
 *
 *  @return 容量大小,单位为GB
 */
CGFloat sys_total_disk_space();

#pragma mark 返回设备当前可用的容量大小
/**
 *  @Author DT
 *
 *  @brief  返回设备当前可用的容量大小,跟系统的有点出入
 *
 *  @return 容量大小,单位为MB
 */
CGFloat sys_free_disk_space();

#pragma mark 返回系统可以使用的内存大小
/**
 *  @Author DT
 *
 *  @brief  返回系统可以使用的内存的大小
 *
 *  @return 内存大小,单位为MB
 */
CGFloat sys_available_memory();

#pragma mark 返回应用当前使用的内存的大小
/**
 *  @Author DT
 *
 *  @brief  返回应用当前使用的内存的大小
 *
 *  @return 内存大小,单位为MB
 */
CGFloat sys_used_memory();

#pragma mark 获取应用程序名称
/**
 *  @Author DT
 *
 *  @brief 获取APP名称,使用CFBundleDisplayName
 *
 *  @return 名称
 */
NSString* sys_name();

#pragma mark 获取应用程序APP名称
/**
 *  @Author DT
 *
 *  @brief 获取APP项目名称
 *
 *  @return 项目名称
 */
NSString* sys_project_name();

#pragma mark 获取应用程序包名
/**
 *  @Author DT
 *
 *  @brief 获取APP项目包名
 *
 *  @return 包名
 */
NSString* sys_bundle_name();

#pragma mark 获取应用程序Bundle Identifier
/**
 *  @Author DT
 *
 *  @brief 获取APP项目Bundle Identifier
 *
 *  @return Bundle Identifier
 */
NSString* sys_identifier();

#pragma mark 获取应用程序版本号
/**
 *  @Author DT
 *
 *  @brief 获取APP项目版本
 *
 *  @return Version
 */
NSString* sys_version();

#pragma mark 获取应用程序Build
/**
 *  @Author DT
 *
 *  @brief 获取APP项目Build
 *
 *  @return Build
 */
NSString* sys_build();

#pragma mark 获取设备的硬件名称
/**
 *  @Author DT
 *
 *  @brief  获取设备的硬件名称
 *
 *  @return 硬件名称
 */
NSString* sys_current_device_information();

#pragma mark 获取设备关于本机名称
/**
 *  @Author DT
 *
 *  @brief 获取设备名称(关于本机 - 名称)
 *
 *  @return 名称
 */
NSString* sys_device_name();

#pragma mark 获取设备系统名称
/**
 *  @Author DT
 *
 *  @brief 获取设备系统名称(iPhone OS or iPod OS)
 *
 *  @return 系统名称
 */
NSString* sys_device_system_name();

#pragma mark 获取设备系统版本
/**
 *  @Author DT
 *
 *  @brief 获取设备系统版本
 *
 *  @return 系统版本
 */
NSString* sys_device_version();

#pragma mark 获取设备系统类型
/**
 *  @Author DT
 *
 *  @brief 获取设备系统类型(iPhone os iPod touch)
 *
 *  @return 系统类型
 */
NSString* sys_device_model();

#pragma mark 获取设备系统语言
/**
 *  @Author DT
 *
 *  @brief 获取设备系统语言
 *
 *  @return 语言
 */
NSString* sys_device_language();

#pragma mark 获取设备系统国家
/**
 *  @Author DT
 *
 *  @brief 获取设备系统国家
 *
 *  @return 国家
 */
NSString* sys_device_country();

#pragma mark 获取设备的尺寸
/*
 *  @Author DT
 *
 *  @brief  获取设备的尺寸
 *
 *  @return 返回3.5、4.0、4.7、5.5,未知设备返回-1
 */
CGFloat sys_device_size();

BOOL sys_is4();

BOOL sys_is6();

BOOL sys_isPlus();

#pragma mark - 当前版本号是否与指定版本号相等
/*!
 *  @author DT, 15-09-03 13:09:56
 *
 *  @brief  判断当前版本号是否相等
 *
 *  @param versoin 指定版本号
 *
 *  @return
 */
BOOL sys_isIOSX(CGFloat versoin);

#pragma mark - 当前版本号是否IOS8
/*!
 *  @author DT, 15-09-03 13:09:16
 *
 *  @brief  当前版本号是否IOS8
 *
 *  @return
 */
BOOL sys_isIOS8();

#pragma mark - 当前版本号是否IOS7
/*!
 *  @author DT, 15-09-03 13:09:27
 *
 *  @brief  当前版本号是否IOS7
 *
 *  @return
 */
BOOL sys_isIOS7();

#pragma mark 判断设备是否ipad
/**
 *  @Author DT, 14-12-03 17:12:32
 *
 *  @brief  判断是否ipad
 *
 *  @return 是ipad返回YES,不是返回NO
 */
BOOL systemDeviceIsPad();





