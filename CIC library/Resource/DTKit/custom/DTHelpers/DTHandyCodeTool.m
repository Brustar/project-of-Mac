//
//  DTHandyCodeTool.m
//
//  Created by DT on 15/8/7.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "DTHandyCodeTool.h"
#import <mach/mach.h>
#import"sys/utsname.h"

UIColor* color_rgb(NSInteger r, NSInteger g, NSInteger b)
{
    return color_rgba(r, g, b, 1.f);
}

UIColor* color_rgba(NSInteger r, NSInteger g, NSInteger b, CGFloat a)
{
    return [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a];
}

UIColor* color_black()
{
    return color_black_alpha(1.f);
}

UIColor* color_black_alpha(CGFloat alpha)
{
    return [[UIColor blackColor] colorWithAlphaComponent:alpha];
}

UIColor* color_gray()
{
    return color_gray_alpha(1.f);
}

UIColor* color_gray_alpha(CGFloat alpha)
{
    return [[UIColor grayColor] colorWithAlphaComponent:alpha];
}

UIColor* color_white()
{
    return color_white_alpha(1.f);
}

UIColor* color_white_alpha(CGFloat alpha)
{
    return [[UIColor whiteColor] colorWithAlphaComponent:alpha];
}

UIColor* color_clear()
{
    return [UIColor clearColor];
}

UIColor* color_hex(NSString* hex)
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) return [UIColor clearColor];
    
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return color_rgb(r, g, b);
}

UIFont* font_sys(CGFloat size)
{
    return [UIFont systemFontOfSize:size];
}

UIImage* image_name(NSString* name)
{
    return [UIImage imageNamed:name];
}

UIImage* image_color(UIColor* color)
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

NSString *string_i(int x)
{
    return [NSString stringWithFormat:@"%d",x];
}

NSString *string_l(long x)
{
    return [NSString stringWithFormat:@"%ld",x];
}

 NSString *string_f(float x)
{
    return [NSString stringWithFormat:@"%f",x];
}

NSString* string_format(NSString* string, ...)
{
    //提取不定参数比塞进集合里面
    NSMutableArray* arrays = [NSMutableArray array];
    va_list arguments;
    id eachObject;
    if (string) {
        [arrays addObject:string];
        va_start(arguments, string);
        
        while ((eachObject = va_arg(arguments, id))) {
            [arrays addObject:eachObject];
        }
    }
    va_end(arguments);
    
    NSString *results = @"";
    
    for (NSString* string in arrays) {
        results = [results stringByAppendingString:string];
    }
    
    return results;
}

BOOL string_equal(NSString* string1, NSString* string2)
{
    return [string1 isEqualToString:string2];
}

void notification_post(NSString* name, id object)
{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object];
}

void notification_add(id observer, SEL selector, NSString* name, id object)
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:object];
}

void notification_remove(id observer, NSString* name, id object)
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:name object:object];
}

NSIndexPath* indexPath_row_section(NSInteger row, NSInteger section)
{
    return [NSIndexPath indexPathForRow:row inSection:section];
}

NSArray* Array()
{
    return [NSArray new];
}

NSMutableArray* MutableArray()
{
    return [NSMutableArray new];
}

NSDictionary* Dictionary()
{
    return [NSDictionary new];
}

NSMutableDictionary* MutableDictionary()
{
    return [NSMutableDictionary new];
}

CGFloat sys_screen_width()
{
    return [UIScreen mainScreen].bounds.size.width;
}

CGFloat sys_screen_height()
{
    return [UIScreen mainScreen].bounds.size.height;
}

CGFloat sys_total_disk_space()
{
    //苹果的计量是1000而不是1024！！
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [[fattributes objectForKey:NSFileSystemSize] floatValue ]/ 1000.0f / 1000.0f / 1000.0f;
}

CGFloat sys_free_disk_space()
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [[fattributes objectForKey:NSFileSystemFreeSize] floatValue ]/ 1000.0 / 1000.0 ;
}

CGFloat sys_available_memory()
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(),
                                               HOST_VM_INFO,
                                               (host_info_t)&vmStats,
                                               &infoCount);
    
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return ((vm_page_size *vmStats.free_count) / 1000.0) / 1000.0;
}

CGFloat sys_used_memory()
{
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
        return YES;
    }
    return NO;
}

NSString* sys_name()
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *displayName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    if (displayName == nil || [displayName isEqualToString:@""]) {
        return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
    }
    return displayName;
}

NSString* sys_project_name()
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
}

NSString* sys_bundle_name()
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
}

NSString* sys_identifier()
{
    return [[NSBundle mainBundle] bundleIdentifier];
}

NSString* sys_version()
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return  [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

NSString* sys_build()
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return  [infoDictionary objectForKey:@"CFBundleVersion"];
}

NSString* sys_current_device_information()
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,3"]) return @"iPhone se";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone se";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    //iPod Touch
    if ([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch";
    if ([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"]) return @"iPod Touch 6G";
    //iPad
    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    //iPad Air
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    //iPad mini
    if ([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,7"]) return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,8"]) return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,9"]) return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad5,1"]) return @"iPad Mini 4";
    if ([platform isEqualToString:@"iPad5,2"]) return @"iPad Mini 4";
    if ([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator"; 
    return platform;
}

NSString* sys_device_name()
{
    return [[UIDevice currentDevice] name];
}

NSString* sys_device_system_name()
{
    return [[UIDevice currentDevice] systemName];
}

NSString* sys_device_version()
{
    return [[UIDevice currentDevice] systemVersion];
}

NSString* sys_device_model()
{
    return [[UIDevice currentDevice] model];
}

NSString* sys_device_language()
{
    return [[NSLocale preferredLanguages] objectAtIndex:0];
}

NSString* sys_device_country()
{
    return [[NSLocale currentLocale] localeIdentifier];
}

CGFloat sys_device_size()
{
    int width = [UIScreen mainScreen].bounds.size.width;
    int height = [UIScreen mainScreen].bounds.size.height;
    if (width == 320 && height == 480) {
        return 3.5;
    }else if (width == 320 && height == 568){
        return 4.0;
    }else if (width == 375 && height == 667){
        return 4.7;
    }else if (width == 414 && height == 736){
        return 5.5;
    }
    return -1;
}

BOOL sys_is4()
{
    NSInteger width = [UIScreen mainScreen].bounds.size.width;
    NSInteger height = [UIScreen mainScreen].bounds.size.height;
    if (width == 320 && height == 568) {
        return YES;
    }
    return NO;
}

BOOL sys_is6()
{
    NSInteger width = [UIScreen mainScreen].bounds.size.width;
    NSInteger height = [UIScreen mainScreen].bounds.size.height;
    if (width == 375 && height == 667) {
        return YES;
    }
    return NO;
}

BOOL sys_isPlus()
{
    NSInteger width = [UIScreen mainScreen].bounds.size.width;
    NSInteger height = [UIScreen mainScreen].bounds.size.height;
    if (width == 414 && height == 736) {
        return YES;
    }
    return NO;
}

BOOL sys_isIOSX(CGFloat versoin)
{
    return  ([[[UIDevice currentDevice]systemVersion] floatValue] >= versoin);
}

BOOL sys_isIOS8()
{
    return  sys_isIOSX(8.0);
}

BOOL sys_isIOS7()
{
    return  sys_isIOSX(7.0);
}

BOOL systemDeviceIsPad()
{
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
        return YES;
    }
    return NO;
}
