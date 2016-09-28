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
    
    /***************************************************************/
    /*          github:https://github.com/aizexin/AIDemo           */
    /*          email :443792431@qq.com                            */
    /*          简书   :http://www.jianshu.com/p/349a257eaba9       */
    /*                                                             */
    /***************************************************************/
    
    self.window                                     = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor                     = [UIColor whiteColor];//设置通用背景颜色
    [self.window makeKeyAndVisible];
    //选择根控制器
    [AIChooseRootVCTool chooseLoginVC];
    //添加侧滑返回
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypePan];//or MLTransitionGestureRecognizerTypeScreenEdgePan
    //智能键盘
    [IQKeyboardManager sharedManager].enable        = YES;
    //环信  appkey和证书换成自己的（目前我推送证书不能用） 测试账号 111密码000   、 222密码000
    [self easemobApplication:application
didFinishLaunchingWithOptions:launchOptions
                      appkey:@"aizexin#aihuanxin"
                apnsCertName:@"zhengshu"
                 otherConfig:nil];
    //  登录
    EMError *error                                  = [[EMClient sharedClient] loginWithUsername:AILoginAccount password:AILoginPassWord];
    if (!error) {
        NSLog(@"登录成功");
    }
    [self setup3DTouch];
    //通过3Dtouch的小图标进来（程序是死的）
    if (launchOptions[UIApplicationLaunchOptionsShortcutItemKey]) {
        [AIChooseRootVCTool chooseVCWithShortcutItem:launchOptions[UIApplicationLaunchOptionsShortcutItemKey]];
        return NO;
    }
    return YES;
}

- (void)setup3DTouch
{
    UIApplicationShortcutIcon *icon1                = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_AdorableStar"];
    UIApplicationShortcutIcon *icon2                = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_Search_brand"];
    UIApplicationShortcutIcon *icon3                = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_Receipt_of_goods"];
    UIApplicationShortcutIcon *icon4                = [UIApplicationShortcutIcon iconWithTemplateImageName:@"fx_3DTouch_Star_Ticket"];

    UIMutableApplicationShortcutItem *item1         = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.adorableStar" localizedTitle:@"萌星说" localizedSubtitle:nil icon:icon1 userInfo:nil];
    UIMutableApplicationShortcutItem *item2         = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.searchBrand" localizedTitle:@"搜品牌" localizedSubtitle:nil icon:icon2 userInfo:nil];
    UIMutableApplicationShortcutItem *item3         = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.receiptOfGoods" localizedTitle:@"查物流" localizedSubtitle:nil icon:icon3 userInfo:nil];
    UIMutableApplicationShortcutItem *item4         = [[UIMutableApplicationShortcutItem alloc]initWithType:@"com.51fanxing.starTicket" localizedTitle:@"摇星券" localizedSubtitle:nil icon:icon4 userInfo:nil];

    NSArray *items                                  = @[item1, item2, item3,item4];
    NSArray *existingItems                          = [UIApplication sharedApplication].shortcutItems;
    NSArray *updatedItems                           = [existingItems arrayByAddingObjectsFromArray:items];
    [UIApplication sharedApplication].shortcutItems = updatedItems;
}

/**
 *  通过3dtouch图标点进来的时候
 *
 *  @param application       <#application description#>
 *  @param shortcutItem      <#shortcutItem description#>
 *  @param completionHandler <#completionHandler description#>
 */
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
{
    [AIChooseRootVCTool chooseVCWithShortcutItem:shortcutItem];
}
@end
