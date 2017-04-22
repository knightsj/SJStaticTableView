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
    //左侧控件的配置
    [self layoutLeftPartSubViewsWithViewModel:viewModel];
    
    //右侧存在箭头
    [self.contentView addSubview:self.indicatorArrow];
    
    //右侧存在箭头+文字
    if ( (viewModel.indicatorLeftTitle) && (viewModel.indicatorLeftLabelSize.width != 0)) {
        [self.contentView addSubview:self.indicatorLeftLabel];
        [self configureIndicatorLeftLabel];
    }
    
    //右侧存在箭头+图片
    if ((self.viewModel.indicatorLeftImage) && (viewModel.indicatorLeftImageSize.height != 0)){
        [self.contentView addSubview:self.indicatorLeftImageView];
        [self configureIndicatorLeftImage];
    }
}

//将右侧label的配置从懒加载里抽出来
- (void)configureIndicatorLeftLabel
{
    
    self.indicatorLeftLabel.font = self.viewModel.indicatorLeftLabelTextFont;
    self.indicatorLeftLabel.textColor = self.viewModel.indicatorLeftLabelTextColor;
    self.indicatorLeftLabel.text = self.viewModel.indicatorLeftTitle;
    
    if (!self.viewModel.hasIndicatorImageAndLabel) {
        //只存在右侧Label
        self.indicatorLeftLabel.frame = CGRectMake(self.indicatorArrow.frame.origin.x - SJLeftGap - self.viewModel.indicatorLeftLabelSize.width  , (self.viewModel.cellHeight - self.viewModel.indicatorLeftLabelSize.height)/2, self.viewModel.indicatorLeftLabelSize.width, self.viewModel.indicatorLeftLabelSize.height);
    }else{
        //右侧Label和image同时存在
        if (self.viewModel.isImageFirst) {
            
            self.indicatorLeftLabel.frame = CGRectMake(SJScreenWidth - SJLeftGap - self.indicatorArrow.bounds.size.width - self.viewModel.indicatorLeftImageAndLabelGap - self.viewModel.indicatorLeftImageSize.width - SJLeftGap - self.viewModel.indicatorLeftLabelSize.width, (self.viewModel.cellHeight - self.viewModel.indicatorLeftLabelSize.height)/2, self.viewModel.indicatorLeftLabelSize.width, self.viewModel.indicatorLeftLabelSize.height);
            
        }else{
            
            self.indicatorLeftLabel.frame = CGRectMake(SJScreenWidth - SJLeftGap - self.indicatorArrow.bounds.size.width - SJLeftGap - self.viewModel.indicatorLeftLabelSize.width, (self.viewModel.cellHeight - self.viewModel.indicatorLeftLabelSize.height)/2, self.viewModel.indicatorLeftLabelSize.width, self.viewModel.indicatorLeftLabelSize.height);
        }
    }
}

//将右侧image的配置从懒加载里抽出来
- (void)configureIndicatorLeftImage
{
    self.indicatorLeftImageView.image = self.viewModel.indicatorLeftImage;
    
    if (!self.viewModel.hasIndicatorImageAndLabel) {
        //只存在右侧image
        self.indicatorLeftImageView.frame = CGRectMake(self.indicatorArrow.frame.origin.x - SJLeftGap - self.viewModel.indicatorLeftImageSize.width, (self.viewModel.cellHeight - self.viewModel.indicatorLeftImageSize.height)/2, self.viewModel.indicatorLeftImageSize.width , self.viewModel.indicatorLeftImageSize.height);
    }else{
        //右侧Label和image同时存在
        if (self.viewModel.isImageFirst) {
            
            self.indicatorLeftImageView.frame = CGRectMake(SJScreenWidth - SJLeftGap - self.indicatorArrow.bounds.size.width - SJLeftGap - self.viewModel.indicatorLeftImageSize.width, (self.viewModel.cellHeight - self.viewModel.indicatorLeftImageSize.height)/2, self.viewModel.indicatorLeftImageSize.width, self.viewModel.indicatorLeftImageSize.height);
            
        }else{
            
            self.indicatorLeftImageView.frame = CGRectMake(SJScreenWidth - SJLeftGap - self.indicatorArrow.bounds.size.width - self.viewModel.indicatorLeftImageAndLabelGap - self.viewModel.indicatorLeftLabelSize.width - SJLeftGap - self.viewModel.indicatorLeftImageSize.width, (self.viewModel.cellHeight - self.viewModel.indicatorLeftImageSize.height)/2, self.viewModel.indicatorLeftImageSize.width,self.viewModel.indicatorLeftImageSize.height);            
        }
        
    }
}

@end
