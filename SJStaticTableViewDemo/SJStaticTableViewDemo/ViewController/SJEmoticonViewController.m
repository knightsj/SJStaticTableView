    //
//  SJEmoticonViewController.m
//  SJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/4/22.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJEmoticonViewController.h"
#import "MBProgressHUD.h"


@interface SJEmoticonViewController ()

@end

@implementation SJEmoticonViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
     self.navigationItem.title = @"表情";
    [self networdRequest];
}


- (void)networdRequest
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    //模拟网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
         self.modelsArray = [Factory emoticonPage];
        [self configureTableView];
        
    });
}

- (void)createDataSource
{
    self.dataSource = [[SJStaticTableViewDataSource alloc] initWithViewModelsArray:self.modelsArray configureBlock:^(SJStaticTableViewCell *cell, SJStaticTableviewCellViewModel *viewModel) {
        
        switch (viewModel.staticCellType) {
                
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
