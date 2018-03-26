//
//  NSObject+AddProperty.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AddProperty)

#pragma mark - 增加一个NSString类型的属性
/*!
 *  @author DT
 *
 *  @brief  增加一个NSString类型的属性
 */
@property (nonatomic,strong) NSString *stringProperty;

#pragma mark - 增加一个NSNumber类型的属性
/*!
 *  @author DT
 *
 *  @brief  增加一个NSNumber类型的属性
 */
@property (nonatomic,strong) NSNumber *numberProperty;

#pragma mark - 增加一个NSInteger类型的属性
/*!
 *  @author DT
 *
 *  @brief  增加一个NSInteger类型的属性
 */
@property (nonatomic,assign) NSInteger integerProperty;

#pragma mark - 增加一个BOOL类型的属性
/*!
 *  @author DT
 *
 *  @brief  增加一个BOOL类型的属性
 */
@property (nonatomic,assign) BOOL boolProperty;

#pragma mark - 增加一个NSIndexPath类型的属性
/*!
 *  @author DT
 *
 *  @brief  增加一个NSIndexPath类型的属性
 */
@property (nonatomic,strong) NSIndexPath *indexPathProperty;

#pragma mark - 增加一个NSArray类型的属性
/*!
 *  @author DT
 *
 *  @brief  增加一个NSArray类型的属性
 */
@property (nonatomic,strong) NSArray *arrayProperty;

#pragma mark - 增加一个NSDictionary类型的属性
/*!
 *  @author DT
 *
 *  @brief  增加一个NSDictionary类型的属性
 */
@property (nonatomic,strong) NSDictionary *dictionaryProperty;

@end
