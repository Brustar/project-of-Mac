//
//  NSObject+AssociatedObject.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/11.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AssociatedObject)

#pragma mark - 对象关联,相当于键值队保存,类型是retain
/*!
 *  @author DT
 *
 *  @brief  对象关联,类型是retain
 *
 *  @param value <#value description#>
 *  @param key   <#key description#>
 */
- (void)associateValue:(id)value withKey:(void *)key;

#pragma mark - 对象关联,相当于键值队保存,类型是assign
/*!
 *  @author DT
 *
 *  @brief  对象关联,类型是assign
 *
 *  @param value <#value description#>
 *  @param key   <#key description#>
 */
- (void)weaklyAssociateValue:(id)value withKey:(void *)key;

#pragma mark - 对象关联,根据key返回value
/*!
 *  @author DT
 *
 *  @brief  根据key返回所关联的对象
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
- (id)associatedValueForKey:(void *)key;

@end
