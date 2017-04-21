//
//  SJStaticTableViewCell+AccessorySwitch.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/17.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewCell+AccessorySwitch.h"

@implementation SJStaticTableViewCell (AccessorySwitch)

- (void)configureAccessorySwitchCellWithViewModel:(SJStaticTableviewCellViewModel *)viewModel
{
    [self layoutLeftPartSubViewsWithViewModel:viewModel];
    [self.contentView addSubview:self.indicatorSwitch];
}

@end
