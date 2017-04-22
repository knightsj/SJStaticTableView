//
//  SJStaticTableViewCell.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewCell.h"

@implementation SJStaticTableViewCell


- (void)layoutLeftPartSubViewsWithViewModel:(SJStaticTableviewCellViewModel *)viewModel
{
    self.viewModel = viewModel;
    
    //存在最左边的图片
    if (self.viewModel.leftImage) {
        
        [self.contentView addSubview:self.leftImageView];
        
         self.leftImageView.image = self.viewModel.leftImage;
         self.leftImageView.frame = CGRectMake(SJLeftGap, (self.viewModel.cellHeight - self.viewModel.leftImageSize.height)/2, self.viewModel.leftImageSize.width , self.viewModel.leftImageSize.height);
    }
    
    
    //存在标题文字
    if (self.viewModel.leftTitle.length) {
        
        [self.contentView addSubview:self.leftTitleLabel];
        
        self.leftTitleLabel.font = self.viewModel.leftLabelTextFont;
        self.leftTitleLabel.textColor = self.viewModel.leftLabelTextColor;
        self.leftTitleLabel.text = self.viewModel.leftTitle;
        
        CGFloat x = 0;
        if (_leftImageView) {
            x = CGRectGetMaxX(self.leftImageView.frame) + self.viewModel.leftImageAndLabelGap;
        }else{
            x = SJLeftGap;
        }
        
        self.leftTitleLabel.frame = CGRectMake( x, (self.viewModel.cellHeight - self.viewModel.leftTitleLabelSize.height)/2, self.viewModel.leftTitleLabelSize.width, self.viewModel.leftTitleLabelSize.height);
    }
    
}



#pragma mark- switch block
- (void)switchTouched:(UISwitch *)indicatorSwitch
{
    if (self.viewModel.switchValueDidChangeBlock){
        self.viewModel.switchValueDidChangeBlock(indicatorSwitch.isOn);
    }
}


#pragma mark- system-like cell
#pragma mark basic views
- (UIImageView *)leftImageView
{
    if (!_leftImageView) {
         _leftImageView = [[UIImageView alloc] init];
    }
    return _leftImageView;
}

- (UILabel *)leftTitleLabel
{
    if (!_leftTitleLabel) {
         _leftTitleLabel= [[UILabel alloc] init];
    }
    return _leftTitleLabel;
}


- (UISwitch *)indicatorSwitch
{
    if (!_indicatorSwitch) {
         _indicatorSwitch = [[UISwitch alloc] init];
         _indicatorSwitch.frame = CGRectMake(SJScreenWidth - SJLeftGap - _indicatorSwitch.bounds.size.width, (_viewModel.cellHeight -  _indicatorSwitch.bounds.size.height)/2, _indicatorSwitch.bounds.size.width, _indicatorSwitch.bounds.size.height);
        [_indicatorSwitch addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _indicatorSwitch;
}

- (UIImageView *)indicatorArrow
{
    if (!_indicatorArrow) {
         _indicatorArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SJIndicatorArrow]];
         _indicatorArrow.frame = CGRectMake(SJScreenWidth - SJLeftGap - _indicatorArrow.bounds.size.width, (_viewModel.cellHeight - _indicatorArrow.bounds.size.height)/2, _indicatorArrow.bounds.size.width, _indicatorArrow.bounds.size.height);
    }    
    return _indicatorArrow;
}

- (UILabel *)indicatorLeftLabel
{
    if (!_indicatorLeftLabel) {
         _indicatorLeftLabel= [[UILabel alloc] init];                 
    }
    return _indicatorLeftLabel;
}

- (UIImageView *)indicatorLeftImageView
{
    if (!_indicatorLeftImageView) {
         _indicatorLeftImageView = [[UIImageView alloc] init];        
    }
    return _indicatorLeftImageView;
}



#pragma mark  logout cell
- (UILabel *)logoutLabel
{
    if (!_logoutLabel) {
         _logoutLabel = [[UILabel alloc] init];
         _logoutLabel.frame = CGRectMake(0, 0, SJScreenWidth, _viewModel.cellHeight);
         _logoutLabel.text = @"退出登录";
         _logoutLabel.textAlignment = NSTextAlignmentCenter;
         _logoutLabel.textColor = [UIColor blackColor];
         _logoutLabel.font = SJLogoutButtonFont;
    }
    return _logoutLabel;
}


#pragma mark- custom cell
#pragma mark MeController Avatar Cell
- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
         _avatarImageView = [[UIImageView alloc] initWithImage:self.viewModel.avatarImage];
         _avatarImageView.frame = CGRectMake(SJLeftGap, SJLeftGap, self.viewModel.cellHeight - 2*SJLeftGap,  self.viewModel.cellHeight - 2*SJLeftGap);
        
    }
    return _avatarImageView;
}

- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
         _userNameLabel = [[UILabel alloc] init];
         _userNameLabel.text = self.viewModel.userName;
         _userNameLabel.font = SJLeftTitleTextFont;
         _userNameLabel.textColor = [UIColor blackColor];
         _userNameLabel.frame = CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + SJLeftGap, self.avatarImageView.frame.origin.y + SJLeftGap/2, 150, 20);
        
    }
    return _userNameLabel;
}


- (UILabel *)userIdLabel
{
    if (!_userIdLabel) {
         _userIdLabel   = [[UILabel alloc] init];
         _userIdLabel.text = self.viewModel.userID;
         _userIdLabel.font = [UIFont systemFontOfSize:12];
         _userIdLabel.textColor = [UIColor blackColor];
         _userIdLabel.frame = CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + SJLeftGap, CGRectGetMaxY(self.userNameLabel.frame) + 4, 150, 20);
    }
    return _userIdLabel;
}

- (UIImageView *)avatarIndicatorImageView
{
    if (!_avatarIndicatorImageView) {
         _avatarIndicatorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
         _avatarIndicatorImageView.frame = CGRectMake(SJScreenWidth - SJLeftGap - _avatarIndicatorImageView.bounds.size.width, (_viewModel.cellHeight - _avatarIndicatorImageView.bounds.size.height)/2, _avatarIndicatorImageView.bounds.size.width, _avatarIndicatorImageView.bounds.size.height);
    }
    
    return _avatarIndicatorImageView;
}

- (UIImageView *)codeImageView
{
    if (!_codeImageView) {
         _codeImageView = [[UIImageView alloc] initWithImage:self.viewModel.codeImage];
         _codeImageView.frame = CGRectMake(SJScreenWidth - SJLeftGap - _avatarIndicatorImageView.bounds.size.width - SJLeftGap - 20, (self.viewModel.cellHeight - 20)/2, 20, 20);
    }
    return _codeImageView;
}



@end
