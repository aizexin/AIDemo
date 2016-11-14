//
//  AITabBar.m
//  AIDemo
//
//  Created by 艾泽鑫 on 2016/11/14.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AITabBar.h"

@interface AITabBar ()<UITabBarDelegate>

@end

@implementation AITabBar

// 因为tabbar设置代理先后顺序的原因，如果在初始化时，就将代理设置为自己，系统会在添加到UITabbarController上的时候，将代理设置为UITabbarController。
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    self.delegate = self;
}

#pragma mark --UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
}

@end
