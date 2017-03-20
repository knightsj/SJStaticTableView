//
//  SJMeViewController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJMeViewController.h"
#import "SJStaticTableViewCell+MeAvatar.h"
#import "SJSettingViewController.h"
#import "SJInfoViewController.h"

@interface SJMeViewController ()

@end

@implementation SJMeViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
     self.navigationItem.title = @"我";
}

- (void)createDataSource
{
    self.dataSource = [[SJStaticTableViewDataSource alloc] initWithViewModelsArray:[Factory mePageData] configureBlock:^(SJStaticTableViewCell *cell, SJStaticTableviewCellViewModel *viewModel) {
        
        switch (viewModel.staticCellType) {
                
            case SSJStaticCellTypeSystemAccessoryDisclosureIndicator:
            {
                [cell configureAccessoryDisclosureIndicatorCellWithViewModel:viewModel];
            }
                break;
                
            case SSJStaticCellTypeMeAvatar:
            {
                [cell configureMeAvatarTableViewCellWithViewModel:viewModel];
            }
                break;
                
            default:
                break;
        }
    }];
}

- (void)didSelectViewModel:(SJStaticTableviewCellViewModel *)viewModel atIndexPath:(NSIndexPath *)indexPath
{
    
    switch (viewModel.identifier)
    {
        case 0:
        {
            NSLog(@"跳转到详情页");
            SJInfoViewController *vc = [[SJInfoViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 7:
        {
            NSLog(@"跳转到设置页");
            SJSettingViewController *vc = [[SJSettingViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        
        default:
            break;
    }
}

@end
