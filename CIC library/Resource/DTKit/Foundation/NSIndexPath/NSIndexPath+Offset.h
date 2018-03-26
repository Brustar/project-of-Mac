//
//  NSIndexPath+Offset.h
//
//  Created by Nicolas Goutaland on 04/04/15.
//  Copyright 2015 Nicolas Goutaland. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface NSIndexPath (Offset)

#pragma mark - 获取row-1的上条数据
/*!
 *  @author DT
 *
 *  @brief  获取上一条数据,row-1,section不变;
 *
 *  @return NSIndexPath
 */
- (NSIndexPath *)previousRow;

#pragma mark - 获取row+1的下条数据
/*!
 *  @author DT
 *
 *  @brief  获取下一条数据,row+1,section不变;
 *
 *  @return NSIndexPath
 */
- (NSIndexPath *)nextRow;

#pragma mark - 获取item-1的上条数据
/*!
 *  @author DT
 *
 *  @brief  获取上一条数据,item-1,section不变;
 *
 *  @return NSIndexPath
 */
- (NSIndexPath *)previousItem;

#pragma mark - 获取item+1的下条数据
/*!
 *  @author DT
 *
 *  @brief  获取下一条数据,item+1,,section不变;
 *
 *  @return NSIndexPath
 */
- (NSIndexPath *)nextItem;

#pragma mark - 获取section-1的上条数据
/*!
 *  @author DT
 *
 *  @brief  获取上一条数据,section-1,row不变;
 *
 *  @return NSIndexPath
 */
- (NSIndexPath *)nextSection;

#pragma mark - 获取section+1的下条数据
/*!
 *  @author DT
 *
 *  @brief  获取下一条数据,section+1,row不变;
 *
 *  @return NSIndexPath
 */
- (NSIndexPath *)previousSection;

@end
