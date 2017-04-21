//
//  SJStaticTableViewController.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//


#import "SJStaticTableViewHeader.h"
#import "Factory.h"//假数据

@protocol SJStaticTableViewControllerDelegate <NSObject>

@required
- (void)createDataSource;
@end

@interface SJStaticTableViewController : UIViewController<SJStaticTableViewControllerDelegate,SJStaticTableViewDelegate>

@property (nonatomic, strong) SJStaticTableView *tableView;
@property (nonatomic, strong) SJStaticTableViewDataSource *dataSource;

@end
