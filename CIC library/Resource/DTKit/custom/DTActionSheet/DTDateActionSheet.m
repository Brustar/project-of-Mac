//
//  DTDateActionSheet.m
//  kingsun
//
//  Created by DT on 2018/2/5.
//Copyright © 2018年 DT. All rights reserved.
//

#import "DTDateActionSheet.h"

@interface DTDateActionSheet ()<DTActionSheetDataSource,DTActionSheetDelegate>

@property (nonatomic, copy  ) NSString          *dateString;

@end

@implementation DTDateActionSheet

#pragma mark - life cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        self.header.titleLabel.text = @"选择日期";
        self.dateString = [[NSDate date] formatWithDate:@"yyyy-MM-dd"];
        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)dealloc {
    
}

#pragma mark - delegate
#pragma mark - DTActionSheetDelegate
- (void)actionSheet:(DTActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex ==0) {
        [self dismiss];
    }else if (buttonIndex ==1) {
        if (self.dateSheetBlock) {
            self.dateSheetBlock(self.dateString);
        }
        [self dismiss];
    }
}
#pragma mark - DTActionSheetDataSource
- (UIView*)contentView:(DTActionSheet*)actionSheet {
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 200)];{
        
        // 初始化pickerView
        self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, mainView.width, mainView.height)];{
            
            [mainView addSubview:self.datePicker];
            
            [self.datePicker setDate:[NSDate date]];
            [self.datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
            [self.datePicker setDatePickerMode:UIDatePickerModeDate];
            [self.datePicker setCalendar:[NSCalendar currentCalendar]];
            [self.datePicker setTimeZone:[NSTimeZone defaultTimeZone]];
//            [self.datePicker setMinimumDate:[NSDate date]];
            
            [self.datePicker addTarget:self action:@selector(dateEventValueChanged:)forControlEvents:UIControlEventValueChanged];
            
            
            [mainView addSubview:self.datePicker];
        }
    }
    return mainView;
}

#pragma mark - event response

#pragma mark - public methods

#pragma mark - private methods
-(void)dateEventValueChanged:(UIDatePicker*)datePicker {
    self.dateString = [[datePicker date] formatWithDate:@"yyyy-MM-dd"];
}

#pragma mark - setter

#pragma mark - getter

@end
