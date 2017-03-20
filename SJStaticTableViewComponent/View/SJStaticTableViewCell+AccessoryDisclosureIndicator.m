//
//  SJStaticTableViewCell+AccessoryDisclosureIndicator.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewCell+AccessoryDisclosureIndicator.h"

@implementation SJStaticTableViewCell (AccessoryDisclosureIndicator)
- (void)configureAccessoryDisclosureIndicatorCellWithViewModel:(SJStaticTableviewCellViewModel *)viewModel
{
    
    [self layoutLeftPartSubViewsWithViewModel:viewModel];
    
    //右侧存在箭头
    [self.contentView addSubview:self.indicatorArrow];
    
    //右侧存在箭头+文字
    if ( (viewModel.indicatorLeftTitle) && (viewModel.indicatorLeftLabelSize.width != 0)) {
        [self.contentView addSubview:self.indicatorLeftLabel];
    }
    
    //右侧存在箭头+图片
    if ((self.viewModel.indicatorLeftImage) && (viewModel.indicatorLeftImageSize.height != 0)){
        [self.contentView addSubview:self.indicatorLeftImageView];
    }
    
}
@end
