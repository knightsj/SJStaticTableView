//
//  SJStaticTableView.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJStaticTableViewDataSource.h"



@protocol SJStaticTableViewDelegate <UITableViewDelegate>

@optional

- (void)didSelectViewModel: (SJStaticTableviewCellViewModel *)viewModel atIndexPath:(NSIndexPath *)indexPath;

@end





@interface SJStaticTableView : UITableView<UITableViewDelegate>

@property (nonatomic, weak) id <SJStaticTableViewDelegate> sjDelegate;
@property (nonatomic, weak) id <SJStaticTableViewDataSource> sjDataSource;

@end
