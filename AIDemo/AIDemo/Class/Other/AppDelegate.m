//
//  AppDelegate.m
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/8.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
//

#import "AppDelegate.h"
#import "AIChooseRootVCTool.h"
#import <MLTransition/MLTransition.h>
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "AppDelegate+EaseMob.h"
#import <EMSDK.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];   //设置通用背景颜色
    [self.window makeKeyAndVisible];
    //选择根控制器
    [AIChooseRootVCTool chooseLoginVC];
    //添加侧滑返回
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypePan];//or MLTransitionGestureRecognizerTypeScreenEdgePan
    //智能键盘
    [IQKeyboardManager sharedManager].enable = YES;
    //环信
    [self easemobApplication:application
didFinishLaunchingWithOptions:launchOptions
                      appkey:@"guozhongkeji#ckddemo"
                apnsCertName:@"zhengshu"
                 otherConfig:nil];
    //  登录
    EMError *error = [[EMClient sharedClient] loginWithUsername:@"text001" password:@"111"];
    if (!error) {
        NSLog(@"登录成功");
    }
    return YES;
}

@end
