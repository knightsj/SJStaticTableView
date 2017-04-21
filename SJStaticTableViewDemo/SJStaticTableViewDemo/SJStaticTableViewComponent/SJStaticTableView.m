//
//  SJStaticTableView.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableView.h"
#import "SJStaticTableviewCellViewModel.h"
#import "SJStaticTableviewSectionViewModel.h"
#import "SJStaticTableViewCell.h"

@implementation SJStaticTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = SJColorWithRGB(240, 239, 245, 1);
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        self.delegate = self;
    }
    return self;
}

- (void)setSjDataSource:(id<SJStaticTableViewDataSource>)sjDataSource
{
    if (_sjDataSource != sjDataSource) {
        _sjDataSource = sjDataSource;
        self.dataSource = _sjDataSource;
    }
}

#pragma mark - Tableview Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SJStaticTableviewCellViewModel *cellViewModel = [self.sjDataSource tableView:tableView cellViewModelAtIndexPath:indexPath];
    return cellViewModel.cellHeight;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    SJStaticTableviewSectionViewModel *sectionViewModel = [self.sjDataSource tableView:tableView sectionViewModelInSection:section];
    return sectionViewModel.sectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    SJStaticTableviewSectionViewModel *sectionViewModel = [self.sjDataSource tableView:tableView sectionViewModelInSection:section];
    return sectionViewModel.sectionFooterHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ((self.sjDelegate) && [self.sjDelegate respondsToSelector:@selector(didSelectViewModel:atIndexPath:)]) {
        
        SJStaticTableviewCellViewModel *cellViewModel = [self.sjDataSource tableView:tableView cellViewModelAtIndexPath:indexPath];
        [self.sjDelegate didSelectViewModel:cellViewModel atIndexPath:indexPath];
        
    }else if((self.sjDelegate)&& [self.sjDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
        
        [self.sjDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
        
    }
}


@end
