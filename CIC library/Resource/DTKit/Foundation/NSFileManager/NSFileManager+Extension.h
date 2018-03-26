//
//  NSFileManager+Extension.h
//  uikitDemo
//
//  Created by DT on 15/8/21.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Documents,//NSDocumentDirectory目录
    Library,//NSLibraryDirectory目录
    Caches,//NSCachesDirectory目录
    Tmp,//NSTemporaryDirectory目录
}DirectoryType;

@interface NSFileManager (Extension)

#pragma mark - 获取沙盒地址
/*!
 *  @author DT
 *
 *  @brief  获取沙盒地址
 *
 *  @param type 目录类型
 *
 *  @return 地址字符串
 */
+ (NSString *)pathForDirectory:(DirectoryType)type;

/*!
 *  @author DT
 *
 *  @brief  获取沙盒地址
 *
 *  @param type      目录类型
 *  @param dirOfFile 子目录(可以是文件夹或文件)
 *
 *  @return 地址字符串
 */
+ (NSString *)pathForDirectory:(DirectoryType)type dirOfFile:(NSString *)dirOfFile;

#pragma mark - 创建本地文件夹
/*!
 *  @author DT
 *
 *  @brief  创建文件夹
 *
 *  @param type      目录类型
 *  @param dirOfFile 子目录
 *  @param block     回调函数
 */
+ (void)createDirectory:(DirectoryType)type
              dirOfFile:(NSString *)dirOfFile
                  block:(void(^)(BOOL result, NSString *url)) block;

#pragma mark - 本地文件创建
/*!
 *  @author DT
 *
 *  @brief  创建文件
 *
 *  @param type      目录类型
 *  @param dirOfFile 子目录
 *  @param block     回调函数
 */
+ (void)createFileAtDirectory:(DirectoryType)type
         dirOfFile:(NSString *)dirOfFile
             block:(void(^)(BOOL result, NSString *url)) block;

#pragma mark - 本地文件数据写入
/*!
 *  @author DT
 *
 *  @brief  本地文件数据写入
 *
 *  @param type      目录类型
 *  @param dirOfFile 子目录
 *  @param value     写入值,支持NSString、NSData、NSDictionary类型数据写入
 *  @param cover     是否覆盖原有值
 *  @param block     回调函数
 *
 */
+ (void) writeToFileAtDirectory:(DirectoryType)type
                      dirOfFile:(NSString*)dirOfFile
                          value:(id)value
                          cover:(BOOL)cover
                          block:(void(^)(BOOL result, NSString *url)) block;

#pragma mark - 本地文件数据读取
/*!
 *  @author DT
 *
 *  @brief  读取本地文件数据
 *
 *  @param path 文件路径地址
 *
 *  @return 返回NSDictionary类型数据
 */
+ (NSDictionary *) readerToFieleWithDict:(NSString*)path;

/*!
 *  @author DT
 *
 *  @brief  读取本地文件数据
 *
 *  @param path 文件路径地址
 *
 *  @return 返回NSData类型数据
 */
+ (NSData *) readerToFieleWithData:(NSString*)path;

/*!
 *  @author DT
 *
 *  @brief  读取本地文件数据
 *
 *  @param path 文件路径地址
 *
 *  @return 返回NSString类型数据
 */
+ (NSString*) readerToFieleWithString:(NSString*)path;

#pragma mark - 本地文件夹(文件)删除
/*!
 *  @author DT
 *
 *  @brief  删除本地文件或者文件夹
 *
 *  @param path 路径地址
 *
 *  @return 成功与否的回调
 */
+ (void) deleteDirOfFileAtPath:(NSString*)path;

#pragma mark - 本地文件夹(文件)大小获取
/*!
 *  @author DT
 *
 *  @brief  获取文件文件夹或文件的大小
 *
 *  @param path 路径地址
 *
 *  @return 返回字节大小,除以1000返回kb,除以1000/1000返回mb
 */
+ (long) checkDirOfFileSizeAtPath:(NSString*)path;

@end
