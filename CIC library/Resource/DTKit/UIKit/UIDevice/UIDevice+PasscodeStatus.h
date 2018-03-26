//
//  UIDevice+PasscodeStatus.h
//  PasscodeStatus
//
//  Created by Liam Nichols on 02/09/2014.
//  Copyright (c) 2014 Liam Nichols. All rights reserved.
//

/**
 *  @Author(作者)         Liam Nichols
 *
 *  @URL(地址)            https://github.com/liamnichols/UIDevice-PasscodeStatus
 *
 *  @Version(版本)        20150620
 *
 *  @Requirements(运行要求)  iOS 8  && A Physical Device
 *
 *  @Description(描述)    A UIDevice category to determine if the passcode is currently set on the device or not.
 *  @Usage(使用) ..
 */
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LNPasscodeStatus){
    /* The passcode status was unknown */
    LNPasscodeStatusUnknown   = 0,
    /* The passcode is enabled */
    LNPasscodeStatusEnabled   = 1,
    /* The passcode is disabled */
    LNPasscodeStatusDisabled  = 2
};

@interface UIDevice (PasscodeStatus)

#pragma mark - 确定设备是否支持' passcodeStatus`检查。密码检查仅支持iOS上8 。
/*!
 *  @author DT, 15-09-02 15:09:25
 *
 *  @brief  确定设备是否支持' passcodeStatus`检查。密码检查仅支持iOS上8 。
 */
@property (readonly) BOOL passcodeStatusSupported;

#pragma mark - 检查并返回设备当前密码的状态。
/*!
 *  @author DT, 15-09-02 15:09:45
 *
 *  @brief  检查并返回设备当前密码的状态。
 */
@property (readonly) LNPasscodeStatus passcodeStatus;

@end
