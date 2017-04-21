//
//  SJStaticTableViewHeader.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/19.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "SJConst.h"                                             //基本配置

#import "SJStaticTableViewController.h"                         //封装好的根类控制器，持有SJStaticTableView
#import "SJStaticTableView.h"                                   //封装好的表格视图
#import "SJStaticTableViewDataSource.h"                         //封装好的数据源

#import "SJStaticTableviewCellViewModel.h"                      //cell对应的viewModel
#import "SJStaticTableviewSectionViewModel.h"                   //section对应的viewModel

#import "SJStaticTableViewCell.h"                               //所有cell的根类
#import "SJStaticTableViewCell+Logout.h"                        //退出登录cell
#import "SJStaticTableViewCell+AccessoryNone.h"                 //右侧没有控件的cell
#import "SJStaticTableViewCell+AccessorySwitch.h"               //右侧有开关的cell
#import "SJStaticTableViewCell+AccessoryDisclosureIndicator.h"  //右侧有剪头的cell


