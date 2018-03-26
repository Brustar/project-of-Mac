//
//  DTTableView.m
//  tableViewDemo
//
//  Created by DT on 14-6-6.
//  Copyright (c) 2014年 DT. All rights reserved.
//

#import "DTTableView.h"
#import "DTTableViewDataSource.h"
#import "DTTableViewSectionDataSource.h"

@interface DTTableView()
{
    NSMutableArray *_tableArray;
}
@property(nonatomic,strong)DTTableViewDataSource *tableViewDataSource;
@end

@implementation DTTableView

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setDefaultParameters];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setDefaultParameters];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setDefaultParameters];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setDefaultParameters];
}

- (void)setDefaultParameters
{
    self.pageNumber = 0;
    self.pages = 20;
    _tableArray = [[NSMutableArray alloc] init];
    self.backgroundView = nil;
    self.backgroundColor = [UIColor clearColor];
    self.sectionType = UITableViewDefault;
//    self.surplusSeparatorEnabled = YES;
    self.separatorZeroEnabled = NO;
}

-(void)setSurplusSeparatorEnabled:(BOOL)surplusSeparatorEnabled
{
    if (surplusSeparatorEnabled) {
        self.tableFooterView = [UIView new];
    }
}

-(void)setSeparatorZeroEnabled:(BOOL)separatorZeroEnabled
{
    _separatorZeroEnabled = separatorZeroEnabled;
    
    if (separatorZeroEnabled) {
        if ([[UIDevice currentDevice].systemVersion floatValue]>=7.0) {
            if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
                [self setSeparatorInset:UIEdgeInsetsZero];
            }
            if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
                if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
                    [self setLayoutMargins:UIEdgeInsetsZero];
                }
            }
        }
    }
}

- (void)registerNibWithName:(NSString*)name identifier:(NSString *)identifier {
    [self registerNib:[UINib nibWithNibName:name bundle:nil] forCellReuseIdentifier:identifier];
}

-(void)removeSectionStickiness:(UIScrollView*)scrollView;
{
    CGFloat sectionHeaderHeight = 44;//section的高度
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

-(void)addFirstArray:(NSMutableArray *)array
{
    [_tableArray removeAllObjects];
    _tableArray = array;
    self.tableViewDataSource.items = _tableArray;
    [self reloadData];
}

-(void)addMoreArray:(NSMutableArray *)array
{
    if (array.count ==0) {
        return;
    }
    NSArray *indexPaths = [[NSArray alloc] initWithObjects:[NSIndexPath indexPathForRow:[self.tableArray count]-1 inSection:0], nil];
    
    int index = (int)[_tableArray count];
    NSMutableArray * indexPathArray = [NSMutableArray arrayWithCapacity:[array count]];
    [_tableArray addObjectsFromArray:array];
    self.tableViewDataSource.items = _tableArray;
    for(int i=index ;i<[_tableArray count];i++){
        [indexPathArray addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    [self beginUpdates];
    [self insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
    [self endUpdates];
    
    [self reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
}

-(NSMutableArray*)tableArray
{
    return _tableArray;
}

- (void)initWithCellIdentifier:(NSString *)cellIdentifier
            configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
{
    if (self.sectionType == UITableViewDefault) {
        self.tableViewDataSource = [[DTTableViewDataSource alloc] initWithIdentifier:cellIdentifier configureCellBlock:configureCellBlock];
        self.tableViewDataSource.tableView = self;
        self.dataSource = self.tableViewDataSource;
    }else{
        self.tableViewDataSource = [[DTTableViewSectionDataSource alloc] initWithIdentifier:cellIdentifier configureCellBlock:configureCellBlock];
        self.tableViewDataSource.tableView = self;
        self.dataSource = self.tableViewDataSource;
    }
}

- (void)initWithCellIdentifiers:(NSDictionary *)cellIdentifiers
           configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
{
    if (self.sectionType == UITableViewDefault) {
        self.tableViewDataSource = [[DTTableViewDataSource alloc] initWithCellIdentifiers:cellIdentifiers configureCellBlock:configureCellBlock];
        self.tableViewDataSource.tableView = self;
        self.dataSource = self.tableViewDataSource;
    }else{
        self.tableViewDataSource = [[DTTableViewSectionDataSource alloc] initWithCellIdentifiers:cellIdentifiers configureCellBlock:configureCellBlock];
        self.tableViewDataSource.tableView = self;
        self.dataSource = self.tableViewDataSource;
    }
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.sectionType == UITableViewDefault) {
        return [self.tableViewDataSource itemAtIndexPath:indexPath];
    }else{
        return [(DTTableViewSectionDataSource*)self.tableViewDataSource itemAtIndexPath:indexPath];
    }
}

- (void)titleForHeaderWithBolock:(TableViewTitleConfigureBlock)configureTitleBlock
{
    [self.tableViewDataSource titleForHeaderWithBolock:configureTitleBlock];
}

- (void)titleForFooterWithBolock:(TableViewTitleConfigureBlock)configureTitleBlock
{
    [self.tableViewDataSource titleForFooterWithBolock:configureTitleBlock];
}
@end
