//
//  NSString+TYCategory.h
//  SunCity-VIP
//
//  Created by Jerry on 1/4/17.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TYCategory)

/**  检测是否为空字符串  */
+ (BOOL)ty_isEmptyWithString:(NSString *)str;

/**  删除字符串最后的空格  */
- (NSString *)ty_trimmingFontSpace;

/**  每个字母后添加空格  */
- (NSString *)ty_addSpaceAfterEveryWord;

/**  检测是否为空字符串 是则返回@""  */
+ (instancetype)ty_checkString:(NSString *)str;

/**
 数组 转 字符串
 @param segmentation 分割字符串
 */
+ (instancetype)ty_stringWithArray:(NSArray<NSString *> *)array segmentation:(NSString *)segmentation;

/**  HTML标签转换  */
- (NSString *)ty_HTMLTagChangeTransform;

#pragma mark - Private Dev Tools (开发工具)

/**  通过字典获取对应的model参数列表  */
+ (void)tydev_getPropertyListStrWithDictionary:(NSDictionary *)dictionary;

@end
