//
//  SJStaticTableViewCell+MeAvatar.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewCell+MeAvatar.h"

@implementation SJStaticTableViewCell (MeAvatar)

- (void)configureMeAvatarTableViewCellWithViewModel:(SJStaticTableviewCellViewModel *)viewModel{
    
    self.viewModel = viewModel;
    
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.userIdLabel];
    [self.contentView addSubview:self.avatarIndicatorImageView];
    [self.contentView addSubview:self.codeImageView];
    
}



@end
