//
//  UIScrollView+Pages.h
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Pages)

#pragma mark - 总共多少页(横向)
- (NSInteger)pages;

#pragma mark - 当前第几页(横向)
- (NSInteger)currentPage;

#pragma mark - 滚动的百分比(横向)
- (CGFloat)scrollPercent;

#pragma mark - 总共多少页(纵向)
- (CGFloat)pagesY;

#pragma mark - 总共多少页(横向)
- (CGFloat)pagesX;

#pragma mark - 当前第几页(纵向)
- (CGFloat)currentPageY;

#pragma mark - 当前第几页(横向)
- (CGFloat)currentPageX;

#pragma mark - 滚动到第几页(纵向)
- (void) setPageY:(CGFloat)page animated:(BOOL)animated;

- (void) setPageY:(CGFloat)page;

#pragma mark - 滚动到第几页(横向)
- (void) setPageX:(CGFloat)page animated:(BOOL)animated;

- (void) setPageX:(CGFloat)page;
@end
