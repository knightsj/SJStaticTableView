//
//  SJInfoViewController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/16.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJInfoViewController.h"


@interface SJInfoViewController ()

@end

@implementation SJInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人信息";
}

- (void)createDataSource
{
    self.dataSource = [[SJStaticTableViewDataSource alloc] initWithViewModelsArray:[Factory infoPageData] configureBlock:^(SJStaticTableViewCell *cell, SJStaticTableviewCellViewModel *viewModel) {
        
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
