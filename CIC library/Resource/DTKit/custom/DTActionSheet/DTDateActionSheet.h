//
//  DTDateActionSheet.h
//  kingsun
//
//  Created by DT on 2018/2/5.
//  Copyright © 2018年 DT. All rights reserved.
//

#import "DTActionSheet.h"

@interface DTDateActionSheet : DTActionSheet

@property (nonatomic, strong) UIDatePicker      *datePicker;

@property (nonatomic, copy)     void(^dateSheetBlock)(NSString* dateString);

@end
