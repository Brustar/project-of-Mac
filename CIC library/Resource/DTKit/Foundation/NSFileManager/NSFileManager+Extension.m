//
//  NSFileManager+Extension.m
//  uikitDemo
//
//  Created by DT on 15/8/21.
//  Copyright (c) 2015年 DT. All rights reserved.
//

#import "NSFileManager+Extension.h"
#import "NSDictionary+Extension.h"

@implementation NSFileManager (Extension)

+ (NSString *)pathForDirectory:(DirectoryType)type
{
    return [self pathForDirectory:type dirOfFile:@""];
}

+ (NSString *)pathForDirectory:(DirectoryType)type dirOfFile:(NSString *)dirOfFile
{
    if (type == Documents) {
        return [self pathForDir:NSDocumentDirectory path:dirOfFile];
    }else if (type == Library) {
        return [self pathForDir:NSLibraryDirectory path:dirOfFile];
    }else if (type == Caches) {
        return [self pathForDir:NSCachesDirectory path:dirOfFile];
    }else if (type == Tmp) {
        if (dirOfFile == nil || [dirOfFile isEqualToString:@""] ) {
            return NSTemporaryDirectory();
        }else{
            return [NSString stringWithFormat:@"%@/%@",NSTemporaryDirectory(),dirOfFile];
        }
    }
    return nil;
}

+ (void)createDirectory:(DirectoryType)type
              dirOfFile:(NSString *)dirOfFile
                  block:(void(^)(BOOL result, NSString *url)) block
{
    NSString *dirPath = [self pathForDirectory:type dirOfFile:dirOfFile];
    BOOL result = [self createDirectorypath:dirPath];
    if (block) {
        block(result,dirPath);
    }
}

+ (void)createFileAtDirectory:(DirectoryType)type
                    dirOfFile:(NSString *)dirOfFile
                        block:(void(^)(BOOL result, NSString *url)) block
{
    NSString *path = [self pathForDirectory:type dirOfFile:dirOfFile];
    BOOL result = [self createFile:path];
    if (block) {
        block(result,path);
    }
}


+ (void) writeToFileAtDirectory:(DirectoryType)type
                      dirOfFile:(NSString*)dirOfFile
                          value:(id)value
                          cover:(BOOL)cover
                          block:(void(^)(BOOL result, NSString *url)) block
{
    NSString *path = [self pathForDirectory:type dirOfFile:dirOfFile];
    BOOL result = NO;
    if ([value isKindOfClass:[NSDictionary class]]) {
        result = [self writeToFile:path dictionary:value cover:cover];
    }else if ([value isKindOfClass:[NSData class]]) {
        result = [self writeToFile:path data:value cover:cover];
    }else if ([value isKindOfClass:[NSString class]]) {
        result = [self writeToFile:path string:value cover:cover];
    }
    if (block) {
        block(result,path);
    }
}

+ (NSDictionary *) readerToFieleWithDict:(NSString*)path
{
    return [NSDictionary dictionaryWithContentsOfFile:path];
}

+ (NSData *) readerToFieleWithData:(NSString*)path
{
    return [NSData dataWithContentsOfFile:path];
}

+ (NSString*) readerToFieleWithString:(NSString*)path
{
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
}

+ (void) deleteDirOfFileAtPath:(NSString*)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:path error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    while ([e nextObject]) {
        [fileManager removeItemAtPath:path error:nil];
    }
    if (!e) {
        [fileManager removeItemAtPath:path error:nil];
    }
}

+ (long) checkDirOfFileSizeAtPath:(NSString*)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *attrDic = [fileManager attributesOfItemAtPath:path error:nil];
    NSNumber *fileSize = [attrDic objectForKey:NSFileSize];
    
    return [fileSize longValue];
}

#pragma mark - private method

+ (NSString *)pathForDir:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSString *)pathForDir:(NSSearchPathDirectory)directory path:(NSString *)path
{
    if (path ==nil || [path isEqualToString:@""]) {
        return [self pathForDir:directory];
    }
    return [NSString stringWithFormat:@"%@/%@",[self pathForDir:directory],path];
}

+ (BOOL )createDirectorypath:(NSString *)path
{
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) ){//判断文件夹是否存在
        return [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return NO;
}

+ (BOOL )createFile:(NSString *)path
{
    NSFileManager* fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:path]) {//判断文件是否存在
        return YES;
    }
    BOOL isFile = NO;
    isFile = [fm createFileAtPath:path contents:nil attributes:nil];
    
    if (!isFile) {//文件创建不成功的话就先创建文件夹才创建文件
        NSString *dirPath = [path stringByDeletingLastPathComponent];
        BOOL result = [self createDirectorypath:dirPath];
        if (result) {
            return [self createFile:path];
        }
    }
    
    return isFile;
}

+ (BOOL) writeToFile:(NSString*)path dictionary:(NSDictionary*)dictionary cover:(BOOL)cover;
{
    BOOL result = [self createFile:path];
    BOOL status = NO;
    if (result) {
        if (!cover) {
            NSDictionary *old = [self readerToFieleWithDict:path];
            if (old) {
                NSDictionary *dict = [NSDictionary dictionaryByMerging:dictionary with:old];
                status = [dict writeToFile:path atomically:YES];
            }else{
                status = [dictionary writeToFile:path atomically:YES];
            }
        }else{
            //在NSArray或 NSDictionary中存储了自定义对象可能就会返回NO,有null也会返回NO
            status = [dictionary writeToFile:path atomically:YES];
        }
    }
    return status;
}

+ (BOOL) writeToFile:(NSString*)path data:(NSData*)data cover:(BOOL)cover;
{
    BOOL result = [self createFile:path];
    BOOL status = NO;
    if (result) {
        if (!cover) {
            NSData *old = [self readerToFieleWithData:path];
            if (old) {
                NSFileHandle *fielHandle = [NSFileHandle fileHandleForUpdatingAtPath:path];
                [fielHandle seekToEndOfFile];  //将节点跳到文件的末尾
                [fielHandle writeData:data]; //追加写入数据
                [fielHandle closeFile];
                status = YES;
            }else{
                status = [data writeToFile:path atomically:YES];
            }
        }else{
            //在NSArray或 NSDictionary中存储了自定义对象可能就会返回NO,有null也会返回NO
            status = [data writeToFile:path atomically:YES];
        }
    }
    return status;
}

+ (BOOL) writeToFile:(NSString*)path string:(NSString*)string cover:(BOOL)cover;
{
    BOOL result = [self createFile:path];
    BOOL status = NO;
    if (result) {
        if (!cover) {
            NSString *old = [self readerToFieleWithString:path];
            if (old) {
                NSString *news = [old stringByAppendingString:string];
                status = [news writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
            }else{
                status = [string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
            }
        }else{
            //在NSArray或 NSDictionary中存储了自定义对象可能就会返回NO,有null也会返回NO
            status = [string writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
    }
    return status;
}

@end
