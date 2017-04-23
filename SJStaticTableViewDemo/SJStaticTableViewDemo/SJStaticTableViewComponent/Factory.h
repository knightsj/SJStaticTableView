//
//  Factory.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject

//我页面
+ (NSArray *)mePageData;

//设置页面
+ (NSArray *)settingPageData;

//个人信息页
+ (NSArray *)infoPageData;

//发现页
+ (NSArray *)momentsPageData;

//定制cell页 - 分组
+ (NSArray *)customCellsPageData;

//定制cell页 - 同组
+ (NSArray *)customCellsOneSectionPageData;

//表情页
+ (NSArray *)emoticonPage;

@end
