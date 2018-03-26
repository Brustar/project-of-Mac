//
//  DTPickerActionSheet.h
//  kingsun
//
//  Created by DT on 2018/2/4.
//  Copyright © 2018年 DT. All rights reserved.
//

#import "DTActionSheet.h"

@interface DTPickerActionSheet : DTActionSheet

@property (nonatomic, copy)     void(^pickerSheetBlock)(NSDictionary* entity);

-(instancetype)initWithTitle:(NSString *)title items:(NSArray*)items selectedItem:(NSDictionary *)selectedItem;

@end
