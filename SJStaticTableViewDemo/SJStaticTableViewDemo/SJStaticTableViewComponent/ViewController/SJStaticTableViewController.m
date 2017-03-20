//
//  SJStaticTableViewController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewController.h"
#import "SJStaticTableViewDataSource.h"



@implementation SJStaticTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self configNav];
    [self createDataSource];
    [self createTableView];
}

- (void)configNav
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    //修改导航条背景色
    self.navigationController.navigationBar.barTintColor = SJColorWithRGB(18, 18, 18, 1.0);
    
    //修改导航条标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    //修改导航条添加的按钮
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)createDataSource
{
    //子类去实现
}


- (void)createTableView {
    
    if (!self.tableView) {
         self.tableView = [[SJStaticTableView alloc] initWithFrame:CGRectMake(0, 0, SJScreenWidth, SJScreenHeight)  style:UITableViewStyleGrouped];
         self.tableView.contentInset = UIEdgeInsetsMake(44,0,0,0);
         self.tableView.sjDelegate = self;
         self.tableView.sjDataSource = self.dataSource;
        [self.view addSubview:self.tableView];
    }
}



@end
