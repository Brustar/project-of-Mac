//
//  NSData+APNSToken.h
//  IOS-Categories
//
//  Created by Jakey on 15/8/7.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (APNSToken)

/*!
 *  @author DT
 *
 *  @brief  获取推送token字符串
 *
 *  @return token字符串
 */
- (NSString*) apnsToken;

@end
