//
//  AIChooseVCTool.m
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/9.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AIChooseRootVCTool.h"
#import "MCLeftSlideViewController.h"
#import "AILeftViewController.h"
#import "AIMainTabbarViewController.h"
@implementation AIChooseRootVCTool


+(void) chooseRootVC{
    /// 设置跟控制器
    //左边控制器
    AILeftViewController *leftVC = [[AILeftViewController alloc]init];
    //tabbar
    AIMainTabbarViewController *tabVC = [[AIMainTabbarViewController alloc]init];
    
    MCLeftSlideViewController *rootVC = [[MCLeftSlideViewController alloc] initWithLeftView:leftVC andMainView:tabVC];
    [UIApplication sharedApplication].keyWindow.rootViewController = rootVC;
//    // 启动图片
//    [[MCAdvertManager sharedInstance] setAdvertViewController];
}

@end
