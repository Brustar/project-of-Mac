//
//  NSData+SDDataCache.h
//  SDCycleScrollView
//
//  Created by aier on 15-3-30.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSData (SDDataCache)

#pragma mark - 把数据用键值对保存到磁盘里缓存起来
/**
 *  将URL作为key保存到磁盘里缓存起来
 *
 *  @param identifier url.absoluteString
 */
- (void)saveDataCacheWithIdentifier:(NSString *)identifier;

#pragma mark - 根据key从磁盘里拿出NSData
/**
 *  取出缓存data
 *
 *  @param identifier url.absoluteString
 *
 *  @return 缓存
 */
+ (NSData *)getDataCacheWithIdentifier:(NSString *)identifier;

@end
