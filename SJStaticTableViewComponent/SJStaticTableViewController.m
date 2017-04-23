//
//  SJStaticTableViewController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewController.h"
#import "SJStaticTableViewDataSource.h"

@interface SJStaticTableViewController()

@property (nonatomic, readwrite, assign) SJDefaultDataType defualtDataType;

@end


@implementation SJStaticTableViewController

#pragma mark- init

- (instancetype)initWithDefaultDataType:(SJDefaultDataType)defualtDataType
{
    self = [super init];
    if (self) {
        self.defualtDataType = defualtDataType;
    }
    return self;
}

- (instancetype)init
{
    self = [self initWithDefaultDataType:SJDefaultDataTypeExist];
    return self;
}

#pragma mark- life circle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self configureNav];
    
    //在能够提供给tableivew全部，或者部分数据源的情况下，可以先构造出tableview；
    //否则，需要在网络请求结束后，手动调用configureTableView方法
    if (self.defualtDataType == SJDefaultDataTypeExist) {
        [self configureTableView];
    }
    
}

#pragma mark- configure subviews
- (void)configureNav
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    //修改导航条背景色
    self.navigationController.navigationBar.barTintColor = SJColorWithRGB(18, 18, 18, 1.0);
    
    //修改导航条标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    //修改导航条添加的按钮
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)configureTableView
{
    [self createDataSource];
    [self createTableView];
}


- (void)createDataSource
{
    //交给子类实现

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
