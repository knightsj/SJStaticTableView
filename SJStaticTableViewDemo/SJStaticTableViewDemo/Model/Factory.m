//
//  Factory.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Factory.h"
#import "SJStaticTableviewCellViewModel.h"
#import "SJStaticTableviewSectionViewModel.h"



@implementation Factory

+ (NSArray *)mePageData
{
    // ========== section 0
    SJStaticTableviewCellViewModel *vm0 = [[SJStaticTableviewCellViewModel alloc] init];
    vm0.cellID = @"avatarCell";
    vm0.identifier = 0;
    vm0.cellHeight = 80;
    vm0.avatarImage = [UIImage imageNamed:@"avatar"];
    vm0.userName = @"J_Knight";
    vm0.userID = @"微信号：xxxxxx";
    vm0.codeImage = [UIImage imageNamed:@"qrcode"];
    vm0.staticCellType = SSJStaticCellTypeMeAvatar;
    
    SJStaticTableviewSectionViewModel *section0 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm0]];
    
    
    
    // ========== section 1
    SJStaticTableviewCellViewModel *vm1 = [[SJStaticTableviewCellViewModel alloc] init];
    vm1.leftImage = [UIImage imageNamed:@"MoreMyAlbum"];
    vm1.leftTitle = @"相册";
    vm1.identifier = 1;
    
    SJStaticTableviewCellViewModel *vm2 = [[SJStaticTableviewCellViewModel alloc] init];
    vm2.leftImage = [UIImage imageNamed:@"MoreMyFavorites"];
    vm2.leftTitle = @"收藏";
    vm2.identifier = 2;
    
    
    SJStaticTableviewCellViewModel *vm3 = [[SJStaticTableviewCellViewModel alloc] init];
    vm3.leftImage = [UIImage imageNamed:@"MoreMyBankCard"];
    vm3.leftTitle = @"钱包";
    vm3.identifier = 3;

    
    SJStaticTableviewCellViewModel *vm4 = [[SJStaticTableviewCellViewModel alloc] init];
    vm4.leftImage = [UIImage imageNamed:@"MyCardPackageIcon"];
    vm4.leftTitle = @"卡包";
    vm4.identifier = 4;
  
    
    SJStaticTableviewSectionViewModel *section1 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm1,vm2,vm3,vm4]];
    
    // ========== section 2
    SJStaticTableviewCellViewModel *vm5 = [[SJStaticTableviewCellViewModel alloc] init];
    vm5.leftImage = [UIImage imageNamed:@"emoticon"];
    vm5.leftTitle = @"表情";
    vm5.identifier = 5;
    
    
    SJStaticTableviewSectionViewModel *section2 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray: @[vm5]];
    
    
    // ========== section 3
    SJStaticTableviewCellViewModel *vm6 = [[SJStaticTableviewCellViewModel alloc] init];
    vm6.leftImage = [UIImage imageNamed:@"MoreSetting"];
    vm6.leftTitle = @"设置";
    vm6.identifier = 7;
    
    
    SJStaticTableviewSectionViewModel *section3 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm6]];
    
    return @[section0,section1,section2,section3];
}


+ (NSArray *)settingPageData
{
    // ========== section 0
    SJStaticTableviewCellViewModel *vm0 = [[SJStaticTableviewCellViewModel alloc] init];
    vm0.leftTitle = @"账号与安全";
    vm0.identifier = 0;
    vm0.indicatorLeftTitle = @"已保护";
    vm0.indicatorLeftImage = [UIImage imageNamed:@"ProfileLockOn"];
    vm0.isImageFirst = NO;
    
    SJStaticTableviewSectionViewModel *section0 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm0]];
    
    
    // ========== section 1
    SJStaticTableviewCellViewModel *vm1 = [[SJStaticTableviewCellViewModel alloc] init];
    vm1.leftTitle = @"新消息通知";
    vm1.identifier = 1;
    
    //额外添加switch
    SJStaticTableviewCellViewModel *vm7 = [[SJStaticTableviewCellViewModel alloc] init];
    vm7.leftTitle = @"夜间模式";
    vm7.switchValueDidChangeBlock = ^(BOOL isON){
        NSString *message = isON?@"打开夜间模式":@"关闭夜间模式";
        NSLog(@"%@",message);
    };
    vm7.staticCellType = SSJStaticCellTypeSystemAccessorySwitch;
    vm7.identifier = 7;
    
    SJStaticTableviewCellViewModel *vm8 = [[SJStaticTableviewCellViewModel alloc] init];
    vm8.leftTitle = @"清理缓存";
    vm8.indicatorLeftTitle = @"12.3M";
    vm8.identifier = 8;
    
    SJStaticTableviewCellViewModel *vm2 = [[SJStaticTableviewCellViewModel alloc] init];
    vm2.leftTitle = @"隐私";
    vm2.identifier = 2;
    
    
    SJStaticTableviewCellViewModel *vm3 = [[SJStaticTableviewCellViewModel alloc] init];
    vm3.leftTitle = @"通用";
    vm3.identifier = 3;
    
    
    SJStaticTableviewSectionViewModel *section1 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm1,vm7,vm8,vm2,vm3]];
    
    // ========== section 2
    SJStaticTableviewCellViewModel *vm4 = [[SJStaticTableviewCellViewModel alloc] init];
    vm4.leftTitle = @"帮助与反馈";
    vm4.identifier = 4;
    
    SJStaticTableviewCellViewModel *vm5 = [[SJStaticTableviewCellViewModel alloc] init];
    vm5.leftTitle = @"关于微信";
    vm5.identifier = 5;
    
    SJStaticTableviewSectionViewModel *section2 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm4,vm5]];
    
    SJStaticTableviewCellViewModel *vm9 = [[SJStaticTableviewCellViewModel alloc] init];
    vm9.leftTitle = @"定制性cell展示页面 - 分组";
    vm9.identifier = 9;
    
    SJStaticTableviewCellViewModel *vm10 = [[SJStaticTableviewCellViewModel alloc] init];
    vm10.leftTitle = @"定制性cell展示页面 - 同组";
    vm10.identifier = 10;
    
    SJStaticTableviewSectionViewModel *section4 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm9,vm10]];
    
    
    // ========== section 3
    SJStaticTableviewCellViewModel *vm6 = [[SJStaticTableviewCellViewModel alloc] init];
    vm6.staticCellType = SSJStaticCellTypeSystemLogout;
    vm6.cellID = @"logout";
    vm6.identifier = 6;
    
    
    SJStaticTableviewSectionViewModel *section3 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm6]];
    
    return @[section0,section1,section2,section4,section3];
}

+ (NSArray *)infoPageData
{
    // ========== section 0
    SJStaticTableviewCellViewModel *vm0 = [[SJStaticTableviewCellViewModel alloc] init];
    vm0.leftTitle = @"头像";
    vm0.identifier = 0;
    vm0.cellHeight = 80;
    vm0.indicatorLeftImage = [UIImage imageNamed:@"avatar"];
    
    SJStaticTableviewCellViewModel *vm1 = [[SJStaticTableviewCellViewModel alloc] init];
    vm1.leftTitle = @"名字";
    vm1.indicatorLeftTitle = @"J_Knight";
    vm1.identifier = 1;
    
    SJStaticTableviewCellViewModel *vm2 = [[SJStaticTableviewCellViewModel alloc] init];
    vm2.leftTitle = @"微信号";
    vm2.indicatorLeftTitle = @"xxxxxx";
    vm2.identifier = 2;
    
    
    SJStaticTableviewCellViewModel *vm3 = [[SJStaticTableviewCellViewModel alloc] init];
    vm3.leftTitle = @"我的二维码";
    vm3.identifier = 3;
    vm3.indicatorLeftImage = [UIImage imageNamed:@"qrcode"];
    
    SJStaticTableviewCellViewModel *vm4 = [[SJStaticTableviewCellViewModel alloc] init];
    vm4.leftTitle = @"我的地址";
    vm4.identifier = 4;
    
    SJStaticTableviewSectionViewModel *section0 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm0,vm1,vm2,vm3,vm4]];
    
    // ========== section 1
    SJStaticTableviewCellViewModel *vm5 = [[SJStaticTableviewCellViewModel alloc] init];
    vm5.leftTitle = @"性别";
    vm5.indicatorLeftTitle = @"男";
    vm5.identifier = 5;
    
    SJStaticTableviewCellViewModel *vm6 = [[SJStaticTableviewCellViewModel alloc] init];
    vm6.leftTitle = @"地区";
    vm6.indicatorLeftTitle = @"上海 闵行";
    vm6.identifier = 6;
    
    SJStaticTableviewCellViewModel *vm7 = [[SJStaticTableviewCellViewModel alloc] init];
    vm7.leftTitle = @"个性签名";
    vm7.indicatorLeftTitle = @"good good study";
    vm7.identifier = 7;
    
    SJStaticTableviewSectionViewModel *section1 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm5,vm6,vm7]];
    
    
    // ========== section 2
    SJStaticTableviewCellViewModel *vm8 = [[SJStaticTableviewCellViewModel alloc] init];
    vm8.leftTitle = @"LinkedIn账号";
    vm8.indicatorLeftTitle = @"展示";
    vm8.identifier = 8;
    
    SJStaticTableviewSectionViewModel *section2 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm8]];
    
     return @[section0,section1,section2];
    
}

+ (NSArray *)momentsPageData
{
    // ========== section 0
    SJStaticTableviewCellViewModel *vm0 = [[SJStaticTableviewCellViewModel alloc] init];
    vm0.leftImage = [UIImage imageNamed:@"ff_IconShowAlbum"];
    vm0.leftTitle = @"朋友圈";
    vm0.indicatorLeftImage = [UIImage imageNamed:@"avatar"];
    vm0.identifier = 0;
    
    SJStaticTableviewSectionViewModel *section0 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray: @[vm0]];
    
    
    // ========== section 1
    SJStaticTableviewCellViewModel *vm1 = [[SJStaticTableviewCellViewModel alloc] init];
    vm1.leftImage = [UIImage imageNamed:@"ff_IconQRCode"];
    vm1.leftTitle = @"扫一扫";
    vm1.identifier = 1;
    
    SJStaticTableviewCellViewModel *vm2 = [[SJStaticTableviewCellViewModel alloc] init];
    vm2.leftImage = [UIImage imageNamed:@"ff_IconShake"];
    vm2.leftTitle = @"摇一摇";
    vm2.identifier = 2;
    
    
    SJStaticTableviewSectionViewModel *section1 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm1,vm2]];
    
    
    SJStaticTableviewCellViewModel *vm3 = [[SJStaticTableviewCellViewModel alloc] init];
    vm3.leftImage = [UIImage imageNamed:@"ff_IconLocationService"];
    vm3.leftTitle = @"附近的人";
    vm3.identifier = 3;
    
    
    SJStaticTableviewCellViewModel *vm4 = [[SJStaticTableviewCellViewModel alloc] init];
    vm4.leftImage = [UIImage imageNamed:@"ff_IconBottle"];
    vm4.leftTitle = @"漂流瓶";
    vm4.identifier = 4;
    
    
    SJStaticTableviewSectionViewModel *section2 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm3,vm4]];
    
    
    // ========== section 2
    SJStaticTableviewCellViewModel *vm5 = [[SJStaticTableviewCellViewModel alloc] init];
    vm5.leftImage = [UIImage imageNamed:@"CreditCard_ShoppingBag"];
    vm5.leftTitle = @"购物";
    vm5.identifier = 5;

    
    // ========== section 3
    SJStaticTableviewCellViewModel *vm6 = [[SJStaticTableviewCellViewModel alloc] init];
    vm6.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm6.leftTitle = @"游戏";
    vm6.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm6.indicatorLeftTitle = @"一起来玩王者荣耀呀!";
    vm6.identifier = 7;
    
    
    SJStaticTableviewSectionViewModel *section3 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm5,vm6]];
    
    return @[section0,section1,section2,section3];
}

+ (NSArray *)customCellsPageData
{
    //默认配置
    SJStaticTableviewCellViewModel *vm1 = [[SJStaticTableviewCellViewModel alloc] init];
    vm1.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm1.leftTitle = @"全部默认配置，用于对照";
    vm1.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm1.indicatorLeftTitle = @"王者荣耀!";
    
    SJStaticTableviewSectionViewModel *section1 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm1]];
    
    SJStaticTableviewCellViewModel *vm2 = [[SJStaticTableviewCellViewModel alloc] init];
    vm2.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm2.leftTitle = @"左侧图片变小";
    vm2.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm2.indicatorLeftTitle = @"王者荣耀!";
    
    SJStaticTableviewSectionViewModel *section2 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm2]];
    section2.leftImageSize = CGSizeMake(20, 20);
    
    SJStaticTableviewCellViewModel *vm3 = [[SJStaticTableviewCellViewModel alloc] init];
    vm3.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm3.leftTitle = @"字体变小变红";
    vm3.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm3.indicatorLeftTitle = @"王者荣耀!";
    
    SJStaticTableviewSectionViewModel *section3 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm3]];
    section3.leftLabelTextFont = [UIFont systemFontOfSize:8];
    section3.leftLabelTextColor = [UIColor redColor];
    
    
    SJStaticTableviewCellViewModel *vm4 = [[SJStaticTableviewCellViewModel alloc] init];
    vm4.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm4.leftTitle = @"左侧两个控件距离变大";
    vm4.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm4.indicatorLeftTitle = @"王者荣耀!";
    
    SJStaticTableviewSectionViewModel *section4 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm4]];
    section4.leftImageAndLabelGap = 20;
    
    
    SJStaticTableviewCellViewModel *vm5 = [[SJStaticTableviewCellViewModel alloc] init];
    vm5.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm5.leftTitle = @"右侧图片变小";
    vm5.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm5.indicatorLeftTitle = @"王者荣耀!";
    
    SJStaticTableviewSectionViewModel *section5 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm5]];
    section5.indicatorLeftImageSize = CGSizeMake(15, 15);
    
    
    SJStaticTableviewCellViewModel *vm6= [[SJStaticTableviewCellViewModel alloc] init];
    vm6.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm6.leftTitle = @"右侧字体变大变蓝";
    vm6.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm6.indicatorLeftTitle = @"王者荣耀!";
    
    SJStaticTableviewSectionViewModel *section6 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm6]];
    section6.indicatorLeftLabelTextFont = [UIFont systemFontOfSize:18];
    section6.indicatorLeftLabelTextColor = [UIColor blueColor];
    
    
    SJStaticTableviewCellViewModel *vm7= [[SJStaticTableviewCellViewModel alloc] init];
    vm7.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm7.leftTitle = @"右侧两个控件距离变大";
    vm7.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm7.indicatorLeftTitle = @"王者荣耀!";
    
    SJStaticTableviewSectionViewModel *section7 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm7]];
    section7.indicatorLeftImageAndLabelGap = 18;
    
    
    return @[section1,section2,section3,section4,section5,section6,section7];
    
}

+ (NSArray *)customCellsOneSectionPageData
{
    //默认配置
    SJStaticTableviewCellViewModel *vm1 = [[SJStaticTableviewCellViewModel alloc] init];
    vm1.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm1.leftTitle = @"全部默认配置，用于对照";
    vm1.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm1.indicatorLeftTitle = @"王者荣耀!";
    
    
    SJStaticTableviewCellViewModel *vm2 = [[SJStaticTableviewCellViewModel alloc] init];
    vm2.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm2.leftTitle = @"左侧图片变小";
    vm2.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm2.indicatorLeftTitle = @"王者荣耀!";
    vm2.leftImageSize = CGSizeMake(20, 20);
    
    
    SJStaticTableviewCellViewModel *vm3 = [[SJStaticTableviewCellViewModel alloc] init];
    vm3.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm3.leftTitle = @"字体变小变红";
    vm3.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm3.indicatorLeftTitle = @"王者荣耀!";
    vm3.leftLabelTextFont = [UIFont systemFontOfSize:8];
    vm3.leftLabelTextColor = [UIColor redColor];
    
    
    
    SJStaticTableviewCellViewModel *vm4 = [[SJStaticTableviewCellViewModel alloc] init];
    vm4.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm4.leftTitle = @"左侧两个控件距离变大";
    vm4.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm4.indicatorLeftTitle = @"王者荣耀!";
    vm4.leftImageAndLabelGap = 20;
    
    
    SJStaticTableviewCellViewModel *vm5 = [[SJStaticTableviewCellViewModel alloc] init];
    vm5.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm5.leftTitle = @"右侧图片变小";
    vm5.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm5.indicatorLeftTitle = @"王者荣耀!";
    vm5.indicatorLeftImageSize = CGSizeMake(15, 15);
    
    
    
    SJStaticTableviewCellViewModel *vm6= [[SJStaticTableviewCellViewModel alloc] init];
    vm6.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm6.leftTitle = @"右侧字体变大变蓝";
    vm6.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm6.indicatorLeftTitle = @"王者荣耀!";
    vm6.indicatorLeftLabelTextFont = [UIFont systemFontOfSize:18];
    vm6.indicatorLeftLabelTextColor = [UIColor blueColor];
    
    
    
    SJStaticTableviewCellViewModel *vm7= [[SJStaticTableviewCellViewModel alloc] init];
    vm7.leftImage = [UIImage imageNamed:@"MoreGame"];
    vm7.leftTitle = @"右侧两个控件距离变大";
    vm7.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm7.indicatorLeftTitle = @"王者荣耀!";
    vm7.indicatorLeftImageAndLabelGap = 18;
    
    SJStaticTableviewSectionViewModel *section1 = [[SJStaticTableviewSectionViewModel alloc] initWithCellViewModelsArray:@[vm1,vm2,vm3,vm4,vm5,vm6,vm7]];
    
    return @[section1];
}

@end
