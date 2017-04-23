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

typedef enum : NSUInteger {
    
    SJDefaultDataTypeExist,    //可以生成默认数据源（1. 完全不依赖网络请求，有现成的数据 2. 先生成默认数据源之，然后通过网络请求来刷新）
    SJDefaultDataTypeNone,     //无法生成默认数据源，完全依赖网络请求
    
}SJDefaultDataType;


@interface SJStaticTableViewController : UIViewController<SJStaticTableViewControllerDelegate,SJStaticTableViewDelegate>

@property (nonatomic, readwrite, strong) SJStaticTableView *tableView;
@property (nonatomic, readwrite, strong) SJStaticTableViewDataSource *dataSource;
@property (nonatomic, readonly, assign) SJDefaultDataType defualtDataType;
@property (nonatomic, readwrite, strong) NSArray *modelsArray;

- (instancetype)initWithDefaultDataType:(SJDefaultDataType)defualtDataType;
- (void)configureTableView;

@end
