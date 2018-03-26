//
//  NSObject+TYCategory.m
//  SunCity-VIP
//
//  Created by Jerry on 7/12/16.
//  Copyright © 2016年 MT. All rights reserved.
//

#import "NSObject+TYCategory.h"


@implementation NSObject (TYCategory)


- (NSDictionary *)dictionaryFromModel
{
    unsigned int count = 0;
    
    
    objc_property_t *propertiesa = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(propertiesa[i])];
        id value = [self valueForKey:key];
        
        NSLog(@"%@ : %@", key, value);
        
    }
    
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        id value = [self valueForKey:key];
        
        
        // 暂时过滤掉非自定义的参数
        NSArray *filtrationKeys = @[@"hash", @"superclass", @"description", @"debugDescription"];
        BOOL isFlitration = NO;
        for (NSString *filtrationKey in filtrationKeys) {
            if ([filtrationKey isEqualToString:key]) {
                isFlitration = YES;
                break;
            }
        }
        if (isFlitration) {
            continue;
        }
        
        
        //only add it to dictionary if it is not nil
        if (key && value) {
            if ([value isKindOfClass:[NSString class]]
                || [value isKindOfClass:[NSNumber class]]) {
                // 普通类型的直接变成字典的值
                [dict setObject:value forKey:key];
            }
            else if ([value isKindOfClass:[NSArray class]]
                     || [value isKindOfClass:[NSDictionary class]]) {
                // 数组类型或字典类型
                [dict setObject:[self idFromObject:value] forKey:key];
            }
            else {
                // 如果model里有其他自定义模型，则递归将其转换为字典
                [dict setObject:[value dictionaryFromModel] forKey:key];
            }
        } else if (key && value == nil) {
            // 如果当前对象该值为空，设为nil。在字典中直接加nil会抛异常，需要加NSNull对象
            [dict setObject:[NSNull null] forKey:key];
        }
    }
    
    free(properties);
    return dict;
}

- (id)idFromObject:(nonnull id)object
{
    if ([object isKindOfClass:[NSArray class]]) {
        if (object != nil && [object count] > 0) {
            NSMutableArray *array = [NSMutableArray array];
            for (id obj in object) {
                // 基本类型直接添加
                if ([obj isKindOfClass:[NSString class]]
                    || [obj isKindOfClass:[NSNumber class]]) {
                    [array addObject:obj];
                }
                // 字典或数组需递归处理
                else if ([obj isKindOfClass:[NSDictionary class]]
                         || [obj isKindOfClass:[NSArray class]]) {
                    [array addObject:[self idFromObject:obj]];
                }
                // model转化为字典
                else {
                    [array addObject:[obj dictionaryFromModel]];
                }
            }
            return array;
        }
        else {
            return object ? : [NSNull null];
        }
    }
    else if ([object isKindOfClass:[NSDictionary class]]) {
        if (object && [[object allKeys] count] > 0) {
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            for (NSString *key in [object allKeys]) {
                // 基本类型直接添加
                if ([object[key] isKindOfClass:[NSNumber class]]
                    || [object[key] isKindOfClass:[NSString class]]) {
                    [dic setObject:object[key] forKey:key];
                }
                // 字典或数组需递归处理
                else if ([object[key] isKindOfClass:[NSArray class]]
                         || [object[key] isKindOfClass:[NSDictionary class]]) {
                    [dic setObject:[self idFromObject:object[key]] forKey:key];
                }
                // model转化为字典
                else {
                    [dic setObject:[object[key] dictionaryFromModel] forKey:key];
                }
            }
            return dic;
        }
        else {
            return object ? : [NSNull null];
        }
    }
    
    return [NSNull null];
}

- (nullable id)ty_getAssWithkey:(NSString *)key {
    //NSLog(@"获取运行时参数 self地址:%p key:%@", self, key);
    return objc_getAssociatedObject(self, (__bridge const void *)(key));
}
- (void)ty_setAssWithvalue:(id)value key:(NSString *)key {
    TYObjectPolicyType policy;
    if ([value isKindOfClass:[NSObject class]]) {
        if ([value isKindOfClass:[NSString class]]) {
            policy = TYObjectPolicyTypeCopy;
        }
        else if ([value isKindOfClass:[UIView class]]) {
            policy = TYObjectPolicyTypeWeak;
        }
        else {
            policy = TYObjectPolicyTypeStrong;
        }
    } else {
        policy = TYObjectPolicyTypeAssign;
    }
    //NSLog(@"设置运行时参数 self地址:%p key:%@", self, key);
    [self ty_setAssWithvalue:value key:key policy:policy];
}
- (void)ty_setAssWithvalue:(id)value key:(NSString *)key policy:(TYObjectPolicyType)policy {
    
    objc_AssociationPolicy associationPolicy;
    
    switch (policy) {
        case TYObjectPolicyTypeWeak:
            associationPolicy = OBJC_ASSOCIATION_ASSIGN;
            break;
        case TYObjectPolicyTypeStrong:
            associationPolicy = OBJC_ASSOCIATION_RETAIN_NONATOMIC;
            break;
        case TYObjectPolicyTypeAssign:
            associationPolicy = OBJC_ASSOCIATION_ASSIGN;
            break;
        case TYObjectPolicyTypeCopy:
            associationPolicy = OBJC_ASSOCIATION_COPY_NONATOMIC;
            break;
            
        default:
            break;
    }
    objc_setAssociatedObject(self, (__bridge const void *)(key), value, associationPolicy);
}

- (BOOL)ty_isNullKind
{
    if (self==nil || [self isKindOfClass:[NSNull class]]) {
        return YES;
    } else {
        return NO;
    }
}

@end
