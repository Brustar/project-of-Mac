//
//  UIDevice+Hardware.h
//  TestTable
//
//  Created by Inder Kumar Rathore on 19/01/13.
//  Copyright (c) 2013 Rathore. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IS_IPAD (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
#define DEVICE_IOS_VERSION [[UIDevice currentDevice].systemVersion floatValue]
#define DEVICE_HARDWARE_BETTER_THAN(i) [[UIDevice currentDevice] isCurrentDeviceHardwareBetterThan:i]

#define DEVICE_HAS_RETINA_DISPLAY (fabs([UIScreen mainScreen].scale - 2.0) <= fabs([UIScreen mainScreen].scale - 2.0)*DBL_EPSILON)
#define IS_IOS7_OR_LATER (((double)(DEVICE_IOS_VERSION)-7.0) > -((double)(DEVICE_IOS_VERSION)-7.0)*DBL_EPSILON)
#define NSStringAdd568hIfIphone4inch(str) [NSString stringWithFormat:[UIDevice currentDevice].isIphoneWith4inchDisplay ? @"%@-568h" : @"%@", str]

#define IS_IPHONE_5 [[UIScreen mainScreen] applicationFrame].size.height == 568

typedef enum
{
    NOT_AVAILABLE,
    
    IPHONE_2G,
    IPHONE_3G,
    IPHONE_3GS,
    IPHONE_4,
    IPHONE_4_CDMA,
    IPHONE_4S,
    IPHONE_5,
    IPHONE_5_CDMA_GSM,
    IPHONE_5C,
    IPHONE_5C_CDMA_GSM,
    IPHONE_5S,
    IPHONE_5S_CDMA_GSM,
    IPHONE_6,
    IPHONE_6_PLUS,

    
    IPOD_TOUCH_1G,
    IPOD_TOUCH_2G,
    IPOD_TOUCH_3G,
    IPOD_TOUCH_4G,
    IPOD_TOUCH_5G,
    
    IPAD,
    IPAD_2,
    IPAD_2_WIFI,
    IPAD_2_CDMA,
    IPAD_3,
    IPAD_3G,
    IPAD_3_WIFI,
    IPAD_3_WIFI_CDMA,
    IPAD_4,
    IPAD_4_WIFI,
    IPAD_4_GSM_CDMA,
    
    IPAD_MINI,
    IPAD_MINI_WIFI,
    IPAD_MINI_WIFI_CDMA,
    IPAD_MINI_RETINA_WIFI,
    IPAD_MINI_RETINA_WIFI_CDMA,
    
    IPAD_AIR_WIFI,
    IPAD_AIR_WIFI_GSM,
    IPAD_AIR_WIFI_CDMA,
    
    SIMULATOR   //模拟器
} Hardware;


@interface UIDevice (Hardware)

#pragma mark - 返回硬件类型
/*!
 *  @author DT, 15-09-02 15:09:51
 *
 *  @brief  返回硬件类型
 *
 *  @return
 */
- (NSString*)hardwareString;

#pragma mark - 返回设备类型
/*!
 *  @author DT, 15-09-02 15:09:38
 *
 *  @brief  返回设备类型
 *
 *  @return
 */
- (Hardware)hardware;

#pragma mark - 返回硬件串的可读描述
/*!
 *  @author DT, 15-09-02 15:09:31
 *
 *  @brief  返回硬件串的可读描述
 *
 *  @return
 */
- (NSString*)hardwareDescription;

#pragma mark - 返回设备类型
/*!
 *  @author DT, 15-09-02 15:09:48
 *
 *  @brief  返回设备类型
 *
 *  @return 
 */
- (NSString *)hardwareSimpleDescription;

#pragma mark - 判断当前设备是否等于指定设备
/*!
 *  @author DT, 15-09-02 15:09:39
 *
 *  @brief  判断当前设备是否等于指定设备
 *
 *  @param hardware 指定设备
 *
 *  @return
 */
- (BOOL)isCurrentDeviceHardwareBetterThan:(Hardware)hardware;

#pragma mark - 获取视像头的分辨率
/*!
 *  @author DT, 15-09-02 15:09:11
 *
 *  @brief  获取视像头的分辨率
 *
 *  @return
 */
- (CGSize)backCameraStillImageResolutionInPixels;

#pragma mark - 判断是否4寸+的屏幕
/*!
 *  @author DT, 15-09-02 15:09:03
 *
 *  @brief  判断是否4寸+的屏幕
 *
 *  @return
 */
- (BOOL)isIphoneWith4inchDisplay;

#pragma mark - 获取mac地址
/*!
 *  @author DT, 15-09-02 15:09:47
 *
 *  @brief  获取mac地址
 *
 *  @return
 */
+ (NSString *)macAddress;


@end
