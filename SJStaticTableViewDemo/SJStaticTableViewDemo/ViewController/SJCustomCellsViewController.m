//
//  SJCustomCellsViewController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/18.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJCustomCellsViewController.h"

@interface SJCustomCellsViewController ()

@end

@implementation SJCustomCellsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
     self.navigationItem.title = @"定制cell页面 - 分组";
     self.modelsArray = [Factory customCellsPageData];
}


- (void)createDataSource
{
    self.dataSource = [[SJStaticTableViewDataSource alloc] initWithViewModelsArray:self.modelsArray configureBlock:^(SJStaticTableViewCell *cell, SJStaticTableviewCellViewModel *viewModel) {
        
        switch (viewModel.staticCellType)
        {
            case SJStaticCellTypeSystemAccessoryDisclosureIndicator:
            {
                [cell configureAccessoryDisclosureIndicatorCellWithViewModel:viewModel];
            }
                break;
                
            default:
                break;
        }
    }];
}

@end
