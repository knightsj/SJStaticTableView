//
//  SJNavigationController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/17.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJNavigationController.h"

@interface SJNavigationController ()

@end

@implementation SJNavigationController

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return self.childViewControllers.count > 1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        
        // 非根控制器，隐藏底部的tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
