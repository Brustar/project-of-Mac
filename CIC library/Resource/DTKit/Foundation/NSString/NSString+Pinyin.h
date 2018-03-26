//
//  NSString+Pinyin.h
//  Snowball
//
//  Created by croath on 11/11/13.
//  Copyright (c) 2013 Snowball. All rights reserved.
//
// https://github.com/croath/NSString-Pinyin
//  the Chinese Pinyin string of the nsstring

#import <Foundation/Foundation.h>

@interface NSString (Pinyin)

#pragma mark - 获取该字符串的拼音,带声调,有空格
/*!
 *  @author DT
 *
 *  @brief  获取该字符串的拼音,带声调,有空格
 *
 *  @return 带声调的拼音字符串
 */
- (NSString*)pinyinWithPhoneticSymbol;

#pragma mark - 获取该字符串的拼音,不带声调,有空格
/*!
 *  @author DT
 *
 *  @brief  获取该字符串的拼音,不带声调,有空格
 *
 *  @return 不带声调的拼音字符串
 */
- (NSString*)pinyin;

#pragma mark - 获取该字符串的拼音,带声调,有空格的集合
/*!
 *  @author DT
 *
 *  @brief  获取该字符串的拼音,带声调,有空格的集合
 *
 *  @return NSArray
 */
- (NSArray*)pinyinArray;

#pragma mark - 获取该字符串的拼音,没声调,没空格
/*!
 *  @author DT
 *
 *  @brief  获取该字符串的拼音,没声调,没空格
 *
 *  @return 没声调的拼音字符串
 */
- (NSString*)pinyinWithoutBlank;

#pragma mark - 获取该字符串的首字母拼音集合
/*!
 *  @author DT
 *
 *  @brief  获取该字符串的首字母拼音集合
 *
 *  @return NSArray
 */
- (NSArray*)pinyinInitialsArray;

#pragma mark - 获取该字符串的首字母拼音
/*!
 *  @author DT
 *
 *  @brief  获取该字符串的首字母拼音
 *
 *  @return 首拼音字符串
 */
- (NSString*)pinyinInitialsString;

@end
