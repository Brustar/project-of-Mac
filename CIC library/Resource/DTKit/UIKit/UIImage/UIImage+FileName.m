//
//  UIImage+FileName.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//
#import "UIImage+FileName.h"


@implementation UIImage (FileName)

+ (UIImage *)imageWithFileName:(NSString *)name {
    NSString *extension = @"png";
    
    NSArray *components = [name componentsSeparatedByString:@"."];
    if ([components count] >= 2) {
        NSUInteger lastIndex = components.count - 1;
        extension = [components objectAtIndex:lastIndex];
        
        name = [name substringToIndex:(name.length-(extension.length+1))];
    }
    
    // 如果为Retina屏幕且存在对应图片，则返回Retina图片，否则查找普通图片
    if ([UIScreen mainScreen].scale == 2.0) {
        name = [name stringByAppendingString:@"@2x"];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:extension];
        if (path != nil) {
            return [UIImage imageWithContentsOfFile:path];
        }
    }
    
    if ([UIScreen mainScreen].scale == 3.0) {
        name = [name stringByAppendingString:@"@3x"];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:extension];
        if (path != nil) {
            return [UIImage imageWithContentsOfFile:path];
        }
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:extension];
    if (path) {
        return [UIImage imageWithContentsOfFile:path];
    }
    
    return nil;
}

+(UIImage *)imageWithSunCityBackGround
{
    if (DevicePad) {
        if (DevicePortrait) {
            return [UIImage imageWithBundleResouceImageName:@"bg-Portrait" withExtension:@"png"];
        }
        return [UIImage imageWithBundleResouceImageName:@"bg-Landscape" withExtension:@"png"];
    }
    return [UIImage imageWithBundleResouceImageName:@"bg" withExtension:@"png"];
}

+(UIImage *)imageAdapteWithBundleResouceImageName:(NSString *)imageName withExtension:(NSString *)extension
{
    NSString *adapteName = imageName;
    if (DevicePad) {
        if (DevicePortrait) {
            adapteName = [imageName stringByAppendingString:@"_Portrait"];
        }
        else
        {
            adapteName = [imageName stringByAppendingString:@"_Landscape"];
        }
        
    }
    return [UIImage imageWithBundleResouceImageName:adapteName withExtension:extension];
}

+(UIImage *)imageWithBundleResouceImageName:(NSString *)imageName withExtension:(NSString *)extension
{
    NSString *bgImagePath = [[NSBundle mainBundle] resourcePath];
    bgImagePath = [bgImagePath stringByAppendingPathComponent:imageName];
    bgImagePath = [bgImagePath stringByAppendingPathExtension:extension];
    return  [UIImage imageWithContentsOfFile:bgImagePath];
}

@end
