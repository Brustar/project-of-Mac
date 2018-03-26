//
//  NSData+Encrypt.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encrypt)

#pragma mark - AES加密数据
/**
 *  利用AES加密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

#pragma mark - AES解密数据
/**
 *  利用AES解密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

#pragma mark - 3DES加密数据
/**
 *  利用3DES加密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

#pragma mark - 3DES加密数据
/**
 *  利用3DES解密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
@end
