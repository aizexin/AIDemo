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
#import "AILoginViewController.h"
@implementation AIChooseRootVCTool


+(void) chooseLoginVC{
    //登录页面
    AILoginViewController *loginVC = [[AILoginViewController alloc]init];
    // 设置跟控制器
       [UIApplication sharedApplication].keyWindow.rootViewController = loginVC;
    
//    // 启动图片
//    [[MCAdvertManager sharedInstance] setAdvertViewController];
}
+(void) choose2Main{
    //左边控制器
    AILeftViewController *leftVC = [[AILeftViewController alloc]init];
    //tabbar
    AIMainTabbarViewController *tabVC = [[AIMainTabbarViewController alloc]init];

    MCLeftSlideViewController *rootVC = [[MCLeftSlideViewController alloc] initWithLeftView:leftVC andMainView:tabVC];
    // 设置跟控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = rootVC;
}

@end
