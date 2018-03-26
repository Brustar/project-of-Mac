//
//  DTAlertView.m
//  DTKitDemo
//
//  Created by DT on 14-11-26.
//  Copyright (c) 2014年 DT. All rights reserved.
//

#import "MTActionSheet.h"

@interface MTActionSheet() <UIActionSheetDelegate>
{
    NSInteger _buttonIndex;
}
@end

@implementation MTActionSheet

- (id)initWithTitle:(NSString *)title withView:(UIView *)withView cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;
{
    //提取不定参数比塞进集合里面
    NSMutableArray* arrays = [NSMutableArray array];
    va_list arguments;
    id eachObject;
    if (otherButtonTitles) {
        [arrays addObject:otherButtonTitles];
        va_start(arguments, otherButtonTitles);
        
        while ((eachObject = va_arg(arguments, id))) {
            [arrays addObject:eachObject];
        }
    }
    va_end(arguments);
    
    self = [super initWithTitle:title delegate:self cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
    if (self) {
        for (NSString *otherButtonTitle in arrays) {
            if (otherButtonTitle !=nil && ![otherButtonTitle isEqualToString:@""]) {
                [self addButtonWithTitle:otherButtonTitle];
            }
        }
        [self showInView:withView];
    }
    return self;
}

-(void) handlerClickedButton:(MTCallBack)block
{
    callBack = block;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    _buttonIndex = buttonIndex;
    if (callBack) {
        callBack(self,buttonIndex);
    }
}


@end
