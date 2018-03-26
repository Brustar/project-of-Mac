//
//  UIScrollView+Addition.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Addition)

#pragma mark - 获取contentSize的宽度
@property(nonatomic) CGFloat contentWidth;

#pragma mark - 获取contentSize的高度
@property(nonatomic) CGFloat contentHeight;

#pragma mark - 获取contentOffset的x坐标
@property(nonatomic) CGFloat contentOffsetX;

#pragma mark - 获取contentOffset的y坐标
@property(nonatomic) CGFloat contentOffsetY;

#pragma mark - 获取顶部的偏移量
- (CGPoint)topContentOffset;

#pragma mark - 获取底部的偏移量
- (CGPoint)bottomContentOffset;

#pragma mark - 获取左边的偏移量
- (CGPoint)leftContentOffset;

#pragma mark - 获取右边的偏移量
- (CGPoint)rightContentOffset;

#pragma mark - 是否滚动到顶部
- (BOOL)isScrolledToTop;

#pragma mark - 是否滚动到底部
- (BOOL)isScrolledToBottom;

#pragma mark - 是否滚动到最左边
- (BOOL)isScrolledToLeft;

#pragma mark - 是否滚动到最右边
- (BOOL)isScrolledToRight;

#pragma mark - 滚动到顶部
- (void)scrollToTopAnimated:(BOOL)animated;

#pragma mark - 滚动到底部
- (void)scrollToBottomAnimated:(BOOL)animated;

#pragma mark - 滚动到最左边
- (void)scrollToLeftAnimated:(BOOL)animated;

#pragma mark - 滚动到最右边
- (void)scrollToRightAnimated:(BOOL)animated;

#pragma mark - 垂直局中的页数
- (NSUInteger)verticalPageIndex;

#pragma mark - 水平居中的页数
- (NSUInteger)horizontalPageIndex;

#pragma mark - 垂直方向滚动的页码
- (void)scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;

#pragma mark - 水平方向滚动的页码
- (void)scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;

@end
