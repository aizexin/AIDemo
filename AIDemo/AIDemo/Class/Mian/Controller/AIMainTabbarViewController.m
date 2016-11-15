//
//  AIMainTabbarViewController.m
//  AIDemo
//
//  Created by 艾泽鑫 on 16/9/9.
//  Copyright © 2016年 艾泽鑫. All rights reserved.
// 自定义的tabbarController

#import "AIMainTabbarViewController.h"

#import "AIChatViewController.h"
#import "AIPersonalCenterViewController.h"
#import "AIHomePageViewController.h"
#import "AIMainTabbarViewController.h"
#import "AIBaseNavController.h"
#import "AITabBar.h"
@interface AIMainTabbarViewController ()<AITabBarDelegate>
@property(strong,nonatomic)AITabBar *myTabBar;
@end

@implementation AIMainTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTabBar];
    
    //主页
    AIHomePageViewController *homeVC = [[AIHomePageViewController alloc]init];
    [self addOneChildVC:homeVC title:@"home" imageName:@"home_night" selImageName:@"home_press"];
    //聊天页面
    AIChatViewController *chatVC = [[AIChatViewController alloc]init];
    [self addOneChildVC:chatVC title:@"chat" imageName:@"article_night" selImageName:@"article_press_night"];
    //个人中心
    AIPersonalCenterViewController *personalVC = [[AIPersonalCenterViewController alloc]init];
    [self addOneChildVC:personalVC title:@"个人中心" imageName:@"mine_night" selImageName:@"mine_press_night"];
    //设置默认选择第一个
    [self.myTabBar selectIndex:0];
}

/**
 *  添加自控制器
 *
 *  @param chilidVC     自控制器
 *  @param title        标题
 *  @param imageName    正常图片
 *  @param selImageName 被选中图片
 */
-(void)addOneChildVC:(UIViewController*)chilidVC title:(NSString*)title imageName:(NSString*)imageName selImageName:(NSString*)selImageName{
    //设置标题
    chilidVC.title = title;
    //设置正常文字颜色
//    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
//    dictM[NSFontAttributeName] = AITabBarItemFont;
//    dictM[NSForegroundColorAttributeName] = [UIColor blackColor];
//    [chilidVC.tabBarItem setTitleTextAttributes:dictM forState:(UIControlStateNormal)];
//    //设置被选中文字颜色
//    NSMutableDictionary *seldictM = [NSMutableDictionary dictionary];
//    seldictM[NSFontAttributeName] = AITabBarItemFont;
//    seldictM[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    [chilidVC.tabBarItem setTitleTextAttributes:seldictM forState:(UIControlStateSelected)];

    //添加导航控制器
    AIBaseNavController *navVC = [[AIBaseNavController alloc]initWithRootViewController:chilidVC];
  
    [self.myTabBar addTabBarWithNormaName:imageName andImageSelectedName:selImageName andTitle:title];
    [self addChildViewController:navVC];

}

#pragma mark - 3、添加自定义tabBar------
- (void)setUpTabBar
{
    // 1、创建自定义的CHTabBar;
    self.myTabBar = [[AITabBar alloc] initWithFrame:self.tabBar.bounds];
    self.myTabBar.btnDelegate = self;
    [self setValue:self.myTabBar forKey:@"tabBar"];
}

#pragma mark --AITabBarDelegate
-(void)tabBarJumpFrom:(NSInteger)from to:(NSInteger)to{
    //页面跳转
    self.selectedIndex = to;
}
@end
