//
//  SJStaticTableViewCell+Logout.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/16.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewCell+Logout.h"

@implementation SJStaticTableViewCell (Logout)

- (void)configureLogoutTableViewCellWithViewModel:(SJStaticTableviewCellViewModel *)viewModel
{
    self.viewModel = viewModel;
    [self.contentView addSubview:self.logoutLabel];
}
@end
