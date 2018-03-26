//
//  DTActionSheet.h
//  DTKitDemo
//
//  Created by DT on 14-12-30.
//  Copyright (c) 2014年 DT. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kHeaderHeight 52
#define kDuration 0.3

@class DTActionSheet;
@class ActionSheetHeader;

@protocol DTActionSheetDataSource <NSObject>

@required

/*!
 *  @author DT
 *
 *  @brief  ActionSheet的主要View试图
 *
 *  @param actionSheet 当前对象
 *
 *  @return View
 */
- (UIView*)contentView:(DTActionSheet*)actionSheet;

@end

@protocol DTActionSheetDelegate <NSObject>

@optional

/*!
 *  @author DT
 *
 *  @brief  header的按钮时间
 *
 *  @param actionSheet 当前对面
 *  @param buttonIndex 0:左边按钮 1:右边按钮
 */
- (void)actionSheet:(DTActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

/*!
 *  @author DT
 *
 *  @brief  自定义ActionSheet,扩展性高
 */
@interface DTActionSheet : UIView

@property(nonatomic,assign)id<DTActionSheetDataSource> dataSource;
@property(nonatomic,assign)id<DTActionSheetDelegate> delegate;

/*!
 *  @author DT
 *
 *  @brief  inset间隔
 */
@property(nonatomic,assign)UIEdgeInsets contentViewEdgeInsets;

/*!
 *  @author DT
 *
 *  @brief  headerView,可以设置nil或者隐藏来不显示header
 */
@property(nonatomic,strong)ActionSheetHeader *header;

/*!
 *  @author DT
 *
 *  @brief  显示
 */
- (void)show;

/*!
 *  @author DT
 *
 *  @brief  隐藏
 */
- (void)dismiss;

@end

/*!
 *  @author DT
 *
 *  @brief  headerView
 */
@interface ActionSheetHeader : UIView

/*!
 *  @author DT
 *
 *  @brief  背景
 */
@property(nonatomic,strong)UIImageView *bgView;

/*!
 *  @author DT
 *
 *  @brief  中间文本
 */
@property(nonatomic,strong)UILabel *titleLabel;

/*!
 *  @author DT
 *
 *  @brief  左边按钮
 */
@property(nonatomic,strong)UIButton *cancelButton;

/*!
 *  @author DT
 *
 *  @brief  右边按钮
 */
@property(nonatomic,strong)UIButton *doneButton;

@end
