//
//  NSString+TYCategory.m
//  SunCity-VIP
//
//  Created by Jerry on 1/4/17.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "NSString+TYCategory.h"

@implementation NSString (TYCategory)

/**  检测是否为空字符串  */
+ (BOOL)ty_isEmptyWithString:(NSString *)str
{
    if (str==nil || [str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    else if ([str isKindOfClass:[NSString class]]) {
        if (str.length<=0) {
            return YES;
        }
    } else {
        // str!=[NSNull]&&str!=[NSString]
        NSAssert(nil, @"str 不是字符串");
        return YES;
    }
    return NO;
}

/**  删除字符串最后的空格???  */
- (NSString *)ty_trimmingFontSpace
{
    NSString *trimmingText = [self copy];
    
    NSInteger lastWhitespaceIndex = -1;
    for (int i=0; i<trimmingText.length; i++) {
        NSString *subStr = [trimmingText substringWithRange:NSMakeRange(i, 1)];
        if ([subStr isEqualToString:@" "]) {
            lastWhitespaceIndex = i;
        } else {
            break;
        }
    }
    
    if (lastWhitespaceIndex!=-1) {
        NSInteger location = lastWhitespaceIndex+1;
        NSInteger lenght = trimmingText.length-location;
        
        trimmingText = [trimmingText substringWithRange:NSMakeRange(location, lenght)];
    }
    return trimmingText;
}

/**  每个字母后添加空格  */
- (NSString *)ty_addSpaceAfterEveryWord
{
    NSMutableString *modifyStr = [self mutableCopy];
    for (NSInteger i=modifyStr.length-1; i>0; i--) {
        [modifyStr insertString:@" " atIndex:i];
    }
    return modifyStr;
}

/**  检测是否为空字符串 是则返回@""  */
+ (instancetype)ty_checkString:(NSString *)str
{
    if (str==nil || [str isKindOfClass:[NSNull class]] || str.length<=0) {
        return @"";
    } else {
        return str;
    }
}

/**
 数组 转 字符串
 @param segmentation 分割字符串
 */
+ (instancetype)ty_stringWithArray:(NSArray<NSString *> *)array segmentation:(NSString *)segmentation;
{
    if (array.count<=0) return @"";
    
    NSMutableString *finalStr = [NSMutableString string];
    for (int i=0; i<array.count; i++) {
        NSString *tempStr = array[i];
        
        if (i==0) {
            [finalStr appendFormat:@"%@", tempStr];
        } else{
            [finalStr appendFormat:@"%@%@", segmentation, tempStr];
        }
    }
    return finalStr;
}

/**  HTML标签转换  */
- (NSString *)ty_HTMLTagChangeTransform
{
    NSString *misc = [self mutableCopy];
    misc = [misc stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    misc = [misc stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
    misc = [misc stringByReplacingOccurrencesOfString:@"<BR>" withString:@"\n"];
    misc = [misc stringByReplacingOccurrencesOfString:@"<BR/>" withString:@"\n"];
    return misc;
}

#pragma mark - Private Dev Tools(开发工具)
/**  通过字典获取对应的model参数列表  */
+ (void)tydev_getPropertyListStrWithDictionary:(NSDictionary *)dictionary
{
    NSArray *allKeys = [dictionary allKeys];
    
    NSMutableString *propertyStr_M = [NSMutableString string];
    NSMutableString *JSONKeyPathsStrs_M = [NSMutableString string];
    [JSONKeyPathsStrs_M appendString:@"+ (NSDictionary *)JSONKeyPathsByPropertyKey{\n return @{ \n"];
    
    for (int i=0; i<allKeys.count; i++) {
        NSString *tempKey = allKeys[i];
        
        id tempObject = dictionary[tempKey];
        
        NSString *finalKeyName = [self tydev_getParameName:tempKey];
        NSString *finalClassName = [self tydev_getClassNameWithObject:tempObject];
        NSString *stateName = [self tydev_getStateWithClassName:finalClassName];
        
        [propertyStr_M appendFormat:@"@property (nonatomic, %@) %@ *%@; \n", stateName, finalClassName, tempKey];
        [JSONKeyPathsStrs_M appendFormat:@"@\"%@\":@\"%@\",\n", finalKeyName, tempKey];
    }
    [JSONKeyPathsStrs_M appendString:@"};\n }"];
    
    NSLog(@"%@", propertyStr_M);
    NSLog(@"%@", JSONKeyPathsStrs_M);
}


/**  过滤保留参数并在前面添加"_"(如 id -> _id)  */
+ (NSString *)tydev_getParameName:(NSString *)parameName
{
    NSArray *replaceStrs =
    @[
      @"id",
      @"description",
      @"template"
      ];
    
    NSString *finalParame = [parameName mutableCopy];
    for (NSString *tempReplaceStr in replaceStrs) {
        if ([finalParame isEqualToString:tempReplaceStr]) {
            finalParame = [NSString stringWithFormat:@"_%@", finalParame];
            break;
        }
    }
    return finalParame;
}

/**  获取状态(strong or copy)  */
+ (NSString *)tydev_getStateWithClassName:(NSString *)className
{
    if ([className isEqualToString:@"NSString"]) {
        return @"copy";
    } else {
        return @"strong";
    }
}

/**  获取类型名字  */
+ (NSString *)tydev_getClassNameWithObject:(id)object
{
    NSString *className = [NSString stringWithUTF8String:object_getClassName(object)];
    NSString *finalClassName = [self tydev_replaceClassNameString:className];
    return finalClassName;
}

/**  类型变换  */
+ (NSString *)tydev_replaceClassNameString:(NSString *)ordClassName
{
    NSDictionary *replaceDict =
    @{
      @"__NSArrayM":@"NSArray",
      @"__NSDictionaryM":@"NSDictionary",
      @"__NSCFString":@"NSString",
      @"__NSCFNumber":@"NSNumber",
      @"NSTaggedPointerString":@"NSString"
      };
    
    NSString *finalName = @"";
    for (NSString *beReplaceStr in [replaceDict allKeys]) {
        if ([ordClassName isEqualToString:beReplaceStr]) {
            NSString *toReplaceStr = replaceDict[beReplaceStr];
            finalName = toReplaceStr;
            break;
        }
    }
    if ([NSString ty_isEmptyWithString:finalName]) {
        NSLog(@"asdf");
    }
    return finalName;
}

@end
