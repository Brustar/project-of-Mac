//
//  NSObject+TYCategory.h
//  SunCity-VIP
//
//  Created by Jerry on 7/12/16.
//  Copyright © 2016年 MT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TYObjectPolicyType) {
    TYObjectPolicyTypeWeak,
    TYObjectPolicyTypeStrong,
    TYObjectPolicyTypeAssign,
    TYObjectPolicyTypeCopy,
};


@interface NSObject (TYCategory)

/**
 *  模型转字典
 *
 *  @return 字典
 */
- (nonnull NSDictionary *)dictionaryFromModel;

/**
 *  带model的数组或字典转字典
 *
 *  @param object 带model的数组或字典转
 *
 *  @return 字典
 */
- (nonnull id)idFromObject:(nonnull id)object;

- (nullable id)ty_getAssWithkey:(nonnull NSString *)key;
- (void)ty_setAssWithvalue:(nullable id)value key:(nonnull NSString *)key;
- (void)ty_setAssWithvalue:(nullable id)value key:(nonnull NSString *)key policy:(TYObjectPolicyType)policy;

- (BOOL)ty_isNullKind;

@end
