//
//  DTPickerActionSheet.m
//  kingsun
//
//  Created by DT on 2018/2/4.
//Copyright © 2018年 DT. All rights reserved.
//

#import "DTPickerActionSheet.h"

@interface DTPickerActionSheet ()<DTActionSheetDataSource,DTActionSheetDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, assign) NSString      *title;

@property (nonatomic, strong) UIPickerView      *pickerView;
@property (nonatomic, strong) NSArray           *items;
@property (nonatomic, strong) NSDictionary      *entity;

@end

@implementation DTPickerActionSheet

#pragma mark - life cycle

-(instancetype)initWithTitle:(NSString *)title items:(NSArray*)items selectedItem:(NSDictionary *)selectedItem{
    self = [super init];
    if (self) {
        self.title = title;
        self.items = items;
        self.entity = selectedItem;
        
        self.header.titleLabel.text = title;
        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark - delegate
#pragma mark - DTActionSheetDelegate
- (void)actionSheet:(DTActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex ==0) {
        [self dismiss];
    }else if (buttonIndex ==1) {
        if (self.pickerSheetBlock) {
            self.pickerSheetBlock(self.entity);
        }
        [self dismiss];
    }
}
#pragma mark - DTActionSheetDataSource
- (UIView*)contentView:(DTActionSheet*)actionSheet {
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 270)];{
        
        // 初始化pickerView
        self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, mainView.width, mainView.height)];{
            
            [mainView addSubview:self.pickerView];
            
            //指定数据源和委托
            self.pickerView.delegate = self;
            self.pickerView.dataSource = self;
            
            NSInteger row = 0;
            for (NSDictionary *obj in self.items) {
                if ([obj isEqualToDictionary:self.entity]) {
                    [self.pickerView selectRow:row inComponent:0 animated:YES];
                    break;
                }
                row++;
            }
        }
    }
    return mainView;
}

#pragma mark UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.items.count;
}

#pragma mark UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 52.f;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    //可以通过自定义label达到自定义pickerview展示数据的方式
    UILabel* pickerLabel = (UILabel*)view;
    
    if (!pickerLabel) {
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setFont:kArialFont(17)];
    }
    if ([self.pickerView selectedRowInComponent:component] == row) {
        [pickerLabel setTextColor:kOtherColor(@"FF5D4B")];
    }else{
        [pickerLabel setTextColor:kOtherColor(@"92A2B8")];
    }
    
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];//调用上一个委托方法，获得要展示的title
    
    [self.pickerView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.frame.size.height < 1)
        {
            [obj setBackgroundColor:[UIColor clearColor]];
        }
    }];
    
    return pickerLabel;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSDictionary *obj = [self.items objectAtIndex:row];
    return [obj objectForKey:@"name"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.entity = [self.items objectAtIndex:row];
    
    [self.pickerView reloadComponent:component];
}

#pragma mark - event response

#pragma mark - public methods

#pragma mark - private methods

#pragma mark - setter

#pragma mark - getter

@end
