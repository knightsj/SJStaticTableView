//
//  SJDiscoverViewController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/16.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJDiscoverViewController.h"

@interface SJDiscoverViewController ()

@end

@implementation SJDiscoverViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
}


- (void)createDataSource
{
    self.dataSource = [[SJStaticTableViewDataSource alloc] initWithViewModelsArray:[Factory momentsPageData] configureBlock:^(SJStaticTableViewCell *cell, SJStaticTableviewCellViewModel *viewModel) {
        
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
