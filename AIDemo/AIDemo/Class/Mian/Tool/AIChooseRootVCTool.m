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

#import "AINavgationDelegate.h"
@implementation AIChooseRootVCTool


+(void) chooseLoginVC{
    //登录页面
    AILoginViewController *loginVC = [[AILoginViewController alloc]init];
    //先添加一个导航栏
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVC];
    
    // 设置跟控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
    
    nav.delegate = [[AINavgationDelegate alloc]init];
    nav.navigationBarHidden = YES;
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

+(void)chooseVCWithShortcutItem:(UIApplicationShortcutItem *)shortcutItem{
    //左边控制器
    AILeftViewController *leftVC = [[AILeftViewController alloc]init];
    //tabbar
    AIMainTabbarViewController *tabVC = [[AIMainTabbarViewController alloc]init];
    
    MCLeftSlideViewController *rootVC = [[MCLeftSlideViewController alloc] initWithLeftView:leftVC andMainView:tabVC];
    // 设置跟控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = rootVC;
    
    // 判断先前我们设置的唯一标识
    //TODO: 这里通过唯一判断唯一标示进来跳转到不同页面
    if([shortcutItem.type isEqualToString:@"com.51fanxing.adorableStar"]){
        tabVC.selectedIndex = 2;
        AILog(@"星-----");
    }else if ([shortcutItem.type isEqualToString:@"com.51fanxing.searchBrand"]){
    }else if ([shortcutItem.type isEqualToString:@"com.51fanxing.receiptOfGoods"]){
        
    }else if ([shortcutItem.type isEqualToString:@"com.51fanxing.starTicket"]){
        
    }
}

@end
