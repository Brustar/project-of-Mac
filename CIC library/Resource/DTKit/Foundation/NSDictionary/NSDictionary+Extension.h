//
//  NSDictionary+Extension.h
//  uikitDemo
//
//  Created by DT on 15/8/20.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

#pragma mark - NSDictionary数据合并
/*!
 *  @author DT
 *
 *  @brief  NSDictionary合并
 *
 *  @param dict1 NSDictionary1
 *  @param dict2 NSDictionary2
 *
 *  @return 新的NSDictionary
 */
+ (NSDictionary*) dictionaryByMerging:(NSDictionary*)dict1 with:(NSDictionary*)dict2;

/*!
 *  @author DT
 *
 *  @brief  NSDictionary合并
 *
 *  @param dict
 *
 *  @return 新的NSDictionary
 */
- (NSDictionary*) dictionaryByMergingWith:(NSDictionary*)dict;

#pragma mark - 解析url中的NSDictionary数据
/*!
 *  @author DT
 *
 *  @brief  根据url解析出NSDictionary数据
 *
 *  @param query url字符串
 *
 *  @return NSDictionary
 */
+ (NSDictionary*) dictionaryWithURLQuery:(NSString*)query;

#pragma mark - NSDictionary转化成url格式的字符串
/*!
 *  @author DT
 *
 *  @brief  NSDictionary转化成url格式的字符串
 *
 *  @return NSString
 */
- (NSString*) urlQueryString;

#pragma mark - NSDictionary转化成xml格式的字符串
/*!
 *  @author DT
 *
 *  @brief  NSDictionary转化成xml格式的字符串
 *
 *  @return NSString
 */
- (NSString*) xmlString;

#pragma mark - NSDictionary取出相应的多语言String
/*!
 *  @author DT
 *
 *  @brief  NSDictionary取出相应的多语言String
 *
 *  @return NSString
 */
- (NSString *)langCodeString;
- (NSString *)englishString;

#pragma mark - NSDictionary取出相应的多语言Dictionary
/*!
 *  @author DT
 *
 *  @brief  NSDictionary取出相应的多语言Dictionary
 *
 *  @return NSString
 */
- (NSDictionary*) langCodeDictionary;

#pragma mark - NSDictionary转化成json格式的字符串
/*!
 *  @author DT
 *
 *  @brief  NSDictionary转化成json格式的字符串
 *
 *  @return NSString
 */
-(NSString*) jsonString;

#pragma mark - NSDictionary转化成NSData
/*!
 *  @author DT
 *
 *  @brief  NSDictionary转化成NSData
 *
 *  @return NSData
 */
-(NSData*) data;

@end
