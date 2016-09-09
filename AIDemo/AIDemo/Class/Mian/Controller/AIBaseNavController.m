//
//  AIBaseNavController.m
//  AISian
//
//  Created by 艾泽鑫 on 15/9/27.
//  Copyright © 2015年 aizexin. All rights reserved.
//

#import "AIBaseNavController.h"
#import "UIBarButtonItem+AIExtension.h"
@interface AIBaseNavController ()

@end

@implementation AIBaseNavController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        // Custom initialization
    }
    return self;
}


+(void)initialize{
    [self setupBarButtonItemTheme];
    
    //设置标题主题
   UINavigationBar *navBar =  [UINavigationBar appearance];

    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = AINavigationTitleFont;
    navBar.titleTextAttributes = dictM;

}

+(void)setupBarButtonItemTheme{
    /*//设置主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    item.tintColor = [UIColor orangeColor];
    //设置正常状态字体
    NSMutableDictionary *norDictM = [NSMutableDictionary dictionary];
    norDictM[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    // UIOffsetZero是结构体, 只要包装成NSValue对象, 才能放进字典\数组中
#warning  UITextAttributeTextShadowOffset 弃用的函数可以用
    norDictM[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [item setTitleTextAttributes:norDictM forState:(UIControlStateNormal)];
    //设置高亮状态字体
    NSMutableDictionary *higDictM = [NSMutableDictionary dictionaryWithDictionary:norDictM];
    higDictM[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:higDictM forState:(UIControlStateHighlighted)];
    //设置不可选
    NSMutableDictionary *disDictM = [NSMutableDictionary dictionaryWithDictionary:norDictM];
    disDictM[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:disDictM forState:(UIControlStateDisabled)];*/
    //设置主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    item.tintColor = [UIColor orangeColor];
    //设置正常状态字体
    NSMutableDictionary *norDictM = [NSMutableDictionary dictionary];
    norDictM[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    // UIOffsetZero是结构体, 只要包装成NSValue对象, 才能放进字典\数组中
#warning  UITextAttributeTextShadowOffset 弃用的函数可以用
    norDictM[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [item setTitleTextAttributes:norDictM forState:(UIControlStateNormal)];
    //设置高亮状态字体
    NSMutableDictionary *higDictM = [NSMutableDictionary dictionaryWithDictionary:norDictM];
    higDictM[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:higDictM forState:(UIControlStateHighlighted)];
    //设置不可选
    NSMutableDictionary *disDictM = [NSMutableDictionary dictionaryWithDictionary:norDictM];
    disDictM[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:disDictM forState:(UIControlStateDisabled)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTagert:self action:@selector(onClickBackBtn:) NorImageName:@"navigationbar_back" andHeiImageName:@"navigationbar_back_highlighted"];
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTagert:self action:nil NorImageName:@"navigationbar_more" andHeiImageName:@"navigationbar_more_highlighted"];
    }
    [super pushViewController:viewController animated:animated];
}
-(void)onClickBackBtn:(UIBarButtonItem*)barItem{
    [self popViewControllerAnimated:YES];
}


@end
