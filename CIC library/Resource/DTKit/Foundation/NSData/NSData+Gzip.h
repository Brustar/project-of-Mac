//
//  NSData+Gzip.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//


//Add libz.dylib to your project.
#import <Foundation/Foundation.h>

extern NSString* const GzipErrorDomain;

/*!
 *  @author DT
 *
 *  @brief  NSData的Base64数据加密解密
 */
@interface NSData (Gzip)

#pragma mark - NSData数据压缩
/*!
 *  @author DT
 *
 *  @brief  NSData数据压缩,格式是GZIP
 *
 *  @param level 压缩等级,默认是-1
 *
 *  @return 压缩后的NSData数据
 */
- (NSData *)gzippedDataWithCompressionLevel:(float)level;

/*!
 *  @author DT
 *
 *  @brief  NSData数据压缩,格式是GZIP,压缩等级是-1
 *
 *  @return 压缩后的NSData数据
 */
- (NSData *)gzippedData;

#pragma mark - NSData数据解压
/*!
 *  @author DT
 *
 *  @brief  GZIP格式的NSData数据解压
 *
 *  @return 解压后的NSData数据
 */
- (NSData *)gunzippedData;

@end
