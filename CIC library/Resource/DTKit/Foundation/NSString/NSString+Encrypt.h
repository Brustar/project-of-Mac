//
//  NSString+Encrypt.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/26.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encrypt)

#pragma mark - AES加密数据
/**
 *  利用AES加密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return NSString
 */
- (NSString*)encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

#pragma mark - AES解密数据
/**
 *  利用AES解密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return NSString
 */
- (NSString*)decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

#pragma mark - 3DES加密数据
/**
 *  利用3DES加密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return NSString
 */
- (NSString*)encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

#pragma mark - 3DES加密数据
/**
 *  利用3DES解密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSString*)decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

@end
