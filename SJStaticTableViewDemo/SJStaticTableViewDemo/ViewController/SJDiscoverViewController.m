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
    [self networkRequest];
}

- (void)networkRequest
{
    //模拟网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //请求成功
        NSDictionary *responseDict = @{@"title_info":@"新游戏上架啦",
                                       @"title_icon":@"game_1",
                                       @"game_info":@"一起来玩斗地主呀！",
                                       @"game_icon":@"doudizhu"
                                       };
        //将要刷新cell的indexPath
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:3];
        
        //获取cell对应的viewModel
        SJStaticTableviewCellViewModel *viewModel = [self.dataSource tableView:self.tableView cellViewModelAtIndexPath:indexPath];
        
        if (viewModel) {
            //更新viewModel
            viewModel.leftTitle = responseDict[@"title_info"];
            viewModel.leftImage = [UIImage imageNamed:responseDict[@"title_icon"]];
            viewModel.indicatorLeftImage = [UIImage imageNamed:responseDict[@"game_icon"]];
            viewModel.indicatorLeftTitle = responseDict[@"game_info"];
            
            //刷新tableview
            [self.tableView reloadData];
        }
    });
}

- (void)createDataSource
{
    self.dataSource = [[SJStaticTableViewDataSource alloc] initWithViewModelsArray:[Factory momentsPageData] configureBlock:^(SJStaticTableViewCell *cell, SJStaticTableviewCellViewModel *viewModel) {
        
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
