//
//  DTDataAnalysis.h
//  uikitDemo
//
//  Created by DT on 15/8/24.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*!
 *  @author DT
 *
 *  @brief  数据序列号
 */

#pragma mark - NSDictionary数据转化成NSData数据
/*!
 *  @author DT, 15-09-02 00:09:03
 *
 *  @brief  NSDictionary数据转化成NSData数据
 *
 *  @param dictionary
 *
 *  @return NSData
 */
NSData* dictionaryToData(NSDictionary* dictionary);

#pragma mark - NSDictionary数据转化成NSString数据
/*!
 *  @author DT, 15-09-02 00:09:10
 *
 *  @brief  NSDictionary数据转化成NSString数据
 *
 *  @param dictionary
 *
 *  @return NSString
 */
NSString* dictionaryToString(NSDictionary* dictionary);

#pragma mark - NSData数据转化成NSDictionary数据
/*!
 *  @author DT, 15-09-02 00:09:19
 *
 *  @brief  NSData数据转化成NSDictionary
 *
 *  @param data
 *
 *  @return NSDictionary
 */
NSDictionary* dataToDictionary(NSData* data);

#pragma mark - NSData数据转化成NSString数据
/*!
 *  @author DT, 15-09-02 00:09:27
 *
 *  @brief  NSData数据转化成NSString数据
 *
 *  @param data
 *
 *  @return NSString
 */
NSString* dataToString(NSData* data);

#pragma mark - NSString数据转化成NSData数据
/*!
 *  @author DT, 15-09-02 00:09:37
 *
 *  @brief  NSString数据转化成NSData数据
 *
 *  @param string
 *
 *  @return NSData
 */
NSData* stringToData(NSString* string);

#pragma mark - NSString数据转化成NSDictionary数据
/*!
 *  @author DT, 15-09-02 00:09:44
 *
 *  @brief  NSString数据转化成NSDictionary数据
 *
 *  @param string
 *
 *  @return NSDictionary
 */
NSDictionary* stringToDictionary(NSString* string);

#pragma mark - array数据转化成NSString数据
/*!
 *  @author DT, 15-09-02 00:09:44
 *
 *  @brief  array数据转化成NSString数据
 *
 *  @param array(NSArray或者NSMutableArray)
 *
 *  @return NSString
 */
NSString* arrayToString(id array);

#pragma mark - array数据转化成NSDictionary数据
/*!
 *  @author DT, 15-09-02 00:09:44
 *
 *  @brief  array数据转化成NSDictionary数据
 *
 *  @param array(NSArray或者NSMutableArray)
 *
 *  @return NSDictionary
 */
NSDictionary* arrayToDictionary(id array);


