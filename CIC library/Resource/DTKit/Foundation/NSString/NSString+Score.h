//
//  NSString+Score.h
//
//  Created by Nicholas Bruning on 5/12/11.
//  Copyright (c) 2011 Involved Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
enum{
    NSStringScoreOptionNone                         = 1 << 0,
    NSStringScoreOptionFavorSmallerWords            = 1 << 1,
    NSStringScoreOptionReducedLongStringPenalty     = 1 << 2
};

typedef NSUInteger NSStringScoreOption;

//模糊匹配字符串 查找某两个字符串的相似程度
@interface NSString (Score)

#pragma mark - 模糊匹配字符串 查找某两个字符串的相似程度
/*!
 *  @author DT
 *
 *  @brief  模糊匹配字符串 查找某两个字符串的相似程度
 *
 *  @param otherString 被匹配的字符串
 *
 *  @return 匹配程度 [0~1]
 */
- (CGFloat) scoreAgainst:(NSString *)otherString;

/*!
 *  @author DT
 *
 *  @brief  模糊匹配字符串 查找某两个字符串的相似程度
 *
 *  @param otherString 被匹配的字符串
 *  @param fuzziness   模糊程度 [0~1]
 *
 *  @return 匹配程度 [0~1]
 */
- (CGFloat) scoreAgainst:(NSString *)otherString fuzziness:(NSNumber *)fuzziness;

/*!
 *  @author DT
 *
 *  @brief  模糊匹配字符串 查找某两个字符串的相似程度
 *
 *  @param otherString 被匹配的字符串
 *  @param fuzziness   模糊程度 [0~1]
 *  @param options     匹配模式
 *
 *  @return 匹配程度 [0~1]
 */
- (CGFloat) scoreAgainst:(NSString *)otherString fuzziness:(NSNumber *)fuzziness options:(NSStringScoreOption)options;

@end
