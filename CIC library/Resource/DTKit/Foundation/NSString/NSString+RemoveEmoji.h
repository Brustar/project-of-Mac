//
//  NSString+RemoveEmoji.h
//  NSString+RemoveEmoji
//
//  Created by Jakey on 15/5/13.
//  Copyright (c) 2015年 Jakey. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSString (RemoveEmoji)

#pragma mark - 是否包含表情
/*!
 *  @author DT
 *
 *  @brief  是否包含表情
 *
 *  @return
 */
- (BOOL)isIncludingEmoji;

#pragma mark - 删除表情符号
/*!
 *  @author DT
 *
 *  @brief  删除表情符号
 *
 *  @return
 */
- (instancetype)removedEmojiString;

@end
