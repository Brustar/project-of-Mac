//
//  UIDevice+Extension.h
//  DTKitDemo
//
//  Created by DT on 15/9/2.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Extension)

#pragma mark - 返回当前设备的CPU频率
/*!
 *  @author DT, 15-09-02 16:09:12
 *
 *  @brief  返回当前设备的CPU频率
 *
 *  @return
 */
+ (NSUInteger)cpuFrequency;

#pragma mark - 返回当前设备的总线频率
/*!
 *  @author DT, 15-09-02 16:09:24
 *
 *  @brief  返回当前设备的总线频率
 *
 *  @return
 */
+ (NSUInteger)busFrequency;

#pragma mark - 当前设备的RAM大小
/*!
 *  @author DT, 15-09-02 16:09:35
 *
 *  @brief  当前设备的RAM大小
 *
 *  @return
 */
+ (NSUInteger)ramSize;

#pragma mark - 返回当前设备的CPU数量
/*!
 *  @author DT, 15-09-02 16:09:46
 *
 *  @brief  返回当前设备的CPU数量
 *
 *  @return
 */
+ (NSUInteger)cpuNumber;

#pragma mark - 获取iOS系统的版本号
/*!
 *  @author DT, 15-09-02 16:09:55
 *
 *  @brief  获取iOS系统的版本号
 *
 *  @return
 */
+ (NSString *)systemVersion;

#pragma mark 获取应用程序名称
/**
 *  @Author DT, 14-12-01 10:12:10
 *
 *  @brief 获取APP名称,使用CFBundleDisplayName
 *
 *  @return 名称
 */
+ (NSString *)systemName;

#pragma mark - 判断当前系统是否有摄像头
/*!
 *  @author DT, 15-09-02 16:09:01
 *
 *  @brief  判断当前系统是否有摄像头
 *
 *  @return
 */
+ (BOOL)hasCamera;

#pragma mark - 获取手机内存总量, 返回的是字节数
/*!
 *  @author DT, 15-09-02 16:09:08
 *
 *  @brief  获取手机内存总量, 返回的是字节数
 *
 *  @return
 */
+ (NSUInteger)totalMemoryBytes;

#pragma makr - 获取手机可用内存, 返回的是字节数
/*!
 *  @author DT, 15-09-02 16:09:18
 *
 *  @brief  获取手机可用内存, 返回的是字节数
 *
 *  @return
 */
+ (NSUInteger)freeMemoryBytes;

#pragma mark - 获取手机硬盘空闲空间, 返回的是字节数
/*!
 *  @author DT, 15-09-02 16:09:24
 *
 *  @brief  获取手机硬盘空闲空间, 返回的是字节数
 *
 *  @return
 */
+ (long long)freeDiskSpaceBytes;

#pragma mark - 获取手机硬盘总空间, 返回的是字节数
/*!
 *  @author DT, 15-09-02 16:09:36
 *
 *  @brief  获取手机硬盘总空间, 返回的是字节数
 *
 *  @return 
 */
+ (long long)totalDiskSpaceBytes;

@end
