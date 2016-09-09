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
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];   //设置通用背景颜色
    [self.window makeKeyAndVisible];
    //选择根控制器
    [AIChooseRootVCTool chooseRootVC];
    //添加侧滑返回
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypePan];//or MLTransitionGestureRecognizerTypeScreenEdgePan
    //智能键盘
    [IQKeyboardManager sharedManager].enable = YES;
    return YES;
}

@end
