//
//  SJTabBarController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/17.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJTabBarController.h"
#import "SJNavigationController.h"
#import "SJDiscoverViewController.h"
#import "SJMeViewController.h"
#define kThemeColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]

@interface SJTabBarController ()

@end

@implementation SJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.tintColor = kThemeColor;
    
    NSArray *configureArray = @[
                            @{
                                @"class":@"SJDiscoverViewController",
                                @"title":@"发现",
                                @"image_none_selected":@"tabbar_discover",
                                @"image_selected":@"tabbar_discoverHL"
                              },
                            
                            @{
                                @"class":@"SJMeViewController",
                                @"title":@"我",
                                @"image_none_selected":@"tabbar_me",
                                @"image_selected":@"tabbar_meHL"
                                }
                            ];
    
    [configureArray enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [NSClassFromString(dict[@"class"]) new];
        SJNavigationController *nav = [[SJNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[@"title"];
        item.image = [UIImage imageNamed:dict[@"image_none_selected"]];
        item.selectedImage = [[UIImage imageNamed:dict[@"image_selected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : kThemeColor} forState:UIControlStateSelected];
        [self addChildViewController:nav];

    }];
    self.selectedIndex = 0;
}
@end
