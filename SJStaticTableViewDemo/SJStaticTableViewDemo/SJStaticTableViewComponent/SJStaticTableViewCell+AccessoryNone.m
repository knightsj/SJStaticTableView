//
//  SJStaticTableViewCell+AccessoryNone.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/17.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewCell+AccessoryNone.h"

@implementation SJStaticTableViewCell (AccessoryNone)

- (void)configureAccessoryNoneCellWithViewModel:(SJStaticTableviewCellViewModel *)viewModel
{
    [self layoutLeftPartSubViewsWithViewModel:viewModel];
}
@end
