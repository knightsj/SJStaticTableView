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
}


- (void)createDataSource
{
    self.dataSource = [[SJStaticTableViewDataSource alloc] initWithViewModelsArray:[Factory customCellsPageData] configureBlock:^(SJStaticTableViewCell *cell, SJStaticTableviewCellViewModel *viewModel) {
        
        switch (viewModel.staticCellType)
        {
            case SSJStaticCellTypeSystemAccessoryDisclosureIndicator:
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
