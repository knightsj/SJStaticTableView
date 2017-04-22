//
//  SJStaticTableViewDataSource.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewDataSource.h"
#import "SJStaticTableviewCellViewModel.h"
#import "SJStaticTableviewSectionViewModel.h"
#import "SJStaticTableViewCell.h"

@interface SJStaticTableViewDataSource()

@property (nonatomic, copy) SJStaticCellConfigureBlock cellConfigureBlock;

@end


@implementation SJStaticTableViewDataSource

#pragma mark- Public API

- (instancetype)initWithViewModelsArray:(NSArray *)viewModelsArray configureBlock:(SJStaticCellConfigureBlock)block
{
    self = [super init];
    if (self) {
        self.viewModelsArray = viewModelsArray;
        self.cellConfigureBlock = [block copy];
    }
    return self;
}

#pragma mark- SJStaticTableViewDataSource
- (SJStaticTableviewCellViewModel *)tableView:(UITableView *)tableview cellViewModelAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.viewModelsArray.count > indexPath.section) {
        SJStaticTableviewSectionViewModel *sectionViewModel = [self.viewModelsArray objectAtIndex:indexPath.section];
        if (sectionViewModel.cellViewModelsArray.count > indexPath.row) {
            return [sectionViewModel.cellViewModelsArray objectAtIndex:indexPath.row];
        }
    }
    return nil;
}

- (SJStaticTableviewSectionViewModel *)tableView:(UITableView *)tableView sectionViewModelInSection:(NSInteger )section
{
    if (self.viewModelsArray.count > section) {
        return [self.viewModelsArray objectAtIndex:section];
    }
    return nil;
}

#pragma mark - Tableview Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModelsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SJStaticTableviewSectionViewModel *vm = self.viewModelsArray[section];
    return vm.cellViewModelsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    SJStaticTableviewSectionViewModel *sectionViewModel = self.viewModelsArray[indexPath.section];
    SJStaticTableviewCellViewModel *cellViewModel = sectionViewModel.cellViewModelsArray[indexPath.row];
    
    SJStaticTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellViewModel.cellID];
    if (!cell) {
        cell = [[SJStaticTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellViewModel.cellID];
    }
    self.cellConfigureBlock(cell,cellViewModel);
    
    return cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    SJStaticTableviewSectionViewModel *vm = self.viewModelsArray[section];
    return vm.sectionHeaderTitle;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    SJStaticTableviewSectionViewModel *vm = self.viewModelsArray[section];
    return vm.sectionFooterTitle;
}

@end
