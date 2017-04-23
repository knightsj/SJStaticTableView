//
//  SJCustomCellsOneSectionViewController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/18.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJCustomCellsOneSectionViewController.h"

@interface SJCustomCellsOneSectionViewController ()

@end

@implementation SJCustomCellsOneSectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
     self.navigationItem.title = @"定制cell页面 - 同组";
     self.modelsArray = [Factory customCellsOneSectionPageData];
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
